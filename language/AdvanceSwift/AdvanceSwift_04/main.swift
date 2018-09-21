//
//  main.swift
//  AdvanceSwift_04
//
//  Created by yhp on 2018/9/19.
//  Copyright © 2018年 none. All rights reserved.
//

import Foundation

// 结构体和类
let mutableArray:NSMutableArray = [1,2,3]
let otherArray = mutableArray
otherArray.add(4)
print(mutableArray)
print(otherArray)
class BinaryScanner{
    var position:Int
    let data:Data
    
    init(data:Data) {
        self.data     = data
        self.position = 0
    }
}
extension BinaryScanner{
    func scanByte() -> UInt8? {
        guard position < data.endIndex else {
            return nil
        }
        position += 1
        return data[position - 1]
    }
}

func scanRemainingBytes(scanner:BinaryScanner) {
    while let byte = scanner.scanByte(){
        print(byte)
    }
}

let scanner = BinaryScanner(data: Data("hi".utf8))
scanRemainingBytes(scanner: scanner)

struct Point {
    var x : Int
    var y : Int
}
struct Size {
    var width :Int
    var height:Int
}

struct Rectangle {
    var orign:Point
    var size:Size
}

extension Point {
    static let zero = Point(x: 0, y: 0)
}

extension Rectangle {
    init(x:Int = 0,y:Int = 0,width:Int,height:Int) {
        orign = Point(x: x, y: y)
        size = Size(width: width, height: height)
    }
}

let rect = Rectangle(orign: Point.zero, size: Size(width: 320, height: 480))
var screen = Rectangle(width: 320, height: 480){
    didSet{
        print("screen change \(screen)")
    }
}
screen.orign.x = 10
func +(lhs:Point,rhs:Point) -> Point {
    return Point(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
}
extension Rectangle {
    mutating func translate(by offset:Point){
        orign = orign + offset
    }
}
screen.translate(by: Point(x: 10, y: 10))
print(screen)

// mutating 只能在对于实例被var 声明的时候使用
// 属性的setter 自身就是mutating的，你无法调用一个let 变量的setter
extension Rectangle {
    func translated(by offset:Point) -> Rectangle{
        var copy = self
        copy.translate(by: offset)
        return copy
    }
}

// inout 关键字
func translateByTwentyTwenty(rectangle:inout Rectangle) {
    rectangle.translate(by: Point(x: 20, y: 20))
}

var input:[UInt8] = [0x0b,0xad,0xf0,0x0d]
var other:[UInt8] = [0x0d]
var d = Data(bytes: input)
var e = d
d.append(contentsOf: other)
print(d)
print(e)

final class Box<A> {
    var unbox:A
    init(_ value:A) {
        self.unbox = value
    }
}

var x3 = Box(NSMutableData())
print(isKnownUniquelyReferenced(&x3))
var y2 = x3
print(isKnownUniquelyReferenced(&x3))

struct MyData {
    private var _data:Box<NSMutableData>
    fileprivate var _dataForWriting:NSMutableData{
        mutating get{
            if !isKnownUniquelyReferenced(&_data) {
                _data = Box(_data.unbox.mutableCopy() as! NSMutableData)
                print("making a copy")
            }
            return _data.unbox
        }
    }
    init() {
        _data = Box(NSMutableData())
    }
    
    init(_ data:NSData) {
        _data = Box(data.mutableCopy() as! NSMutableData)
    }
    
}
extension MyData {
    mutating func append(_ byte:UInt8) {
        var mutableByte = byte
        _dataForWriting.append(&mutableByte, length: 1)
    }
}

//let theData = NSData(base64Encoded: "andy")!
//var x = MyData(theData)
//let y = x
//print(x._data. === y._data)
//x.append(0x55)
//print(x._data === y._data)

var bytes = MyData()
var copy = bytes

for byte in 0..<5 as CountableRange<UInt8> {
    print("ox\(String(byte,radix:16))")
    bytes.append(byte)
}

// 写是复制的陷阱
final class Empty{}
struct COWStruct {
    var ref = Empty()
    mutating func change() -> String {
        if isKnownUniquelyReferenced(&ref) {
            return "No copy"
        }else{
            return "copy"
        }
    }
}

var s = COWStruct()
print(s.change())
var copy2 = s
print(s.change())

struct ContainerStruct<A> {
    var storage: A
    subscript(s:String)->A{
        get {return storage}
        set {storage = newValue}
    }
}

var d2 = ContainerStruct(storage: COWStruct())
print(d2.storage.change())
print(d2["test"].change())

// 闭包和可变性
var i = 0
func uniqueInteger() -> Int {
    i += 1
    return i
}

let otherFunction:()->Int = uniqueInteger

func uniqueIntegerProvider() -> ()->Int {
    var i = 0
    return {
        i += 1
        return i
    }
}

// swift 的结构体一般存储在栈上，不过对于可变结构体，默认存储在堆上
// 被闭包捕获的变量需要在栈帧之外依然存在
func uniqueIntegerProvider2() -> AnyIterator<Int> {
    var i = 0
    return AnyIterator{
        i += 1
        return i
    }
}

// 内存值类型
struct Person {
    let name: String
    var parents:[Person]
}
var john = Person(name: "andy", parents: [])
john.parents = [john]
print(john)
// weak 引用
// weak 引用的变量可以变为nil，所以他们必须是可选值类型
// 对于每个unowned的引用,swift运行时将为这个对象维护另一个引用计数
// 当所有的strong引用消失时，对象将把它的资源释放掉，引用消失时
// 这部分内存将被标记为僵尸内存，运行时访问就会错误

let handle = FileHandle(forReadingAtPath: "out.html")
let request = URLRequest(url: URL(string: "www.baidu.com")!)
URLSession.shared.dataTask(with: request) { (data, _, _) in
    guard let theData = data else{
        return
    }
    print("completed!")
    handle?.write(theData)
}.resume()









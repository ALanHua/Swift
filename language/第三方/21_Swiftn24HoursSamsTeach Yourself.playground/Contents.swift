//: Playground - noun: a place where people can play

import UIKit

let firstSet:Set<Int> = [1,1,2,3,3,3]
let hyrulianWarning = ["It's", "dangerous", "to", "go","alone!", "Take"]
var hyrulianSet = Set(hyrulianWarning)

hyrulianSet.remove("to")
hyrulianSet
hyrulianSet.remove(at: hyrulianSet.index(of: "Take")!)
hyrulianSet

func addVariadicNumbers(numbers:Int ...) ->Int {
    var result = 0
    for eachNum in numbers {
        result += eachNum
    }
    return result
}
let sum = addVariadicNumbers(numbers:1,4,5,9)

func thisFuncReturnsATuple() -> (a:Int,b:Int,c:Int) {
    return (1,2,3)
}

thisFuncReturnsATuple()

func meanMedianMode(numbers:Int...) -> (mean:Double,median:Int,mode:Int){
    var sum = 0
    for number in numbers {
        sum += number
    }
    let mean = Double(sum) / Double(numbers.count)
    let sortedNumbers = numbers.sorted { (num1, num2) -> Bool in
        return num1 < num2
    }
    let midIndex = numbers.count / 2
    let median = sortedNumbers[midIndex]
//    找到这个值
    var occurences: [Int : Int] = [:]
    for number in numbers {
        if var value = occurences[number]{
            value += 1
            occurences[number] = value
        }else {
            occurences[number] = 1
        }
    }
    var highestPair:(key:Int,value:Int) = (0,0)
    for(key,value) in occurences {
        highestPair = (value > highestPair.value) ? (key,value) : highestPair
    }
    
    let mode = highestPair.key
    
    return (mean,median,mode)
}

let mmm = meanMedianMode(numbers: 1,1,2,3,5,8,13)
mmm.mean
mmm.median
mmm.mode

func performMatchAverage(mathFunc:String) -> ([Int]) -> Double {
    
    func median(numbers:[Int]) -> Double {
        let sortedNumbers = numbers.sorted { (num1:Int, num2:Int) -> Bool in
            return num1 < num2
        }
        let midIndex = numbers.count / 2
        let median = Double(sortedNumbers[midIndex])
        return median
    }
    func mean(numbers:[Int]) -> Double {
        var sum = 0
        for number in numbers {
            sum += number
        }
        let mean = Double(sum) / Double(numbers.count)
        return mean
    }
    
    switch mathFunc{
    case "mean":
        return mean
    default:
        return median
    }
}
var mathFunc = performMatchAverage(mathFunc: "mean")
mathFunc([1,1,2,3,5,8,13])

func mean2(mumbers:[Int]) -> Double {
    var sum = 0
    func meanCombine(num1:Int,num2:Int) -> Int {
        return num1 + num2
    }
    sum = mumbers.reduce(0, meanCombine)
    return Double(sum)
}
mean2(mumbers: [5,6,7])
func mean3(mumbers:[Int]) -> Double {
    let sum = mumbers.reduce(0) { (num1, num2) -> Int in
        return num1 + num2
    }
    return Double(sum)
}
mean3(mumbers: [5,6,7])

//func mean4(mumbers:[Int]) -> Double {
//    let sum = mumbers.reduce(into: 0) { $0 + $1 }
//    return Double(sum)
//}
//mean4(mumbers: [5,6,7])

let a1 = [5,4,1,3,2]
let b1 = a1.sorted()
struct Point {
    var x: Double
    var y: Double
    mutating func moveToZero() {
        self.x = 0.0
        self.y = 0.0
    }
}
var point = Point(x: 3.5, y: 6.0)
print(point)
point.moveToZero()
print(point)

enum GradesKTo5:String {
    case Kindergarten = "K",First = "1st"
    case Second = "2nd",Third = "3rd"
    case Fourth = "4th",Fifth = "5th"
}
var myKid = GradesKTo5.Kindergarten
myKid.rawValue
myKid = .First
myKid.rawValue
enum PhoneNumber {
    case TollFree(Int,Int,Int)
    case InternalExtension(Int)
}
let customerService = PhoneNumber.TollFree(800, 500, 1212)
switch customerService {
case .TollFree(_,_,let ext):
    print("Toll-free number, extension: \(ext)")
case .InternalExtension(let ext):
    print("Internal extension: \(ext)")
}

enum AppleWatch: String {
    case Large = "42 mm",Small = "38 mm"
    init?(watchSize:String){
        if  watchSize == "38 mm"{
            self = .Small
        }else if watchSize == "42 mm" {
            self = .Large
        }else {
            return nil
        }
    }
}
let goodWatch = AppleWatch(watchSize: "42 mm")
struct Rectangle {
    var width: Double
    var height: Double
    init(width:Double,height: Double) {
        self.width  = width
        self.height = height
    }
    init() {
        self.init(width: 1.0, height: 1.0)
    }
}

print(Rectangle(width: 4.0, height: 6.0))
print(Rectangle())

class Vehicle {
    var speed: Int
    var speedLimit: Int {
        willSet{
            print("Preparing to change speed to \(newValue) MPH")
        }
        didSet{
            let changeSpeed: () -> () = (speed > speedLimit) ? slowdown : speedup
            while speed != speedLimit {
                changeSpeed()
            }
        print("Now I'm driving \(speed) MPH because the speed limit changed to \(speedLimit) MPH from \(oldValue) MPH\n")
        }
    }
    
    init(speedLimit:Int,speed:Int) {
        self.speedLimit = speedLimit
        self.speed  = speed
        print("Speed limit is \(speedLimit) MPH, I'm driving:\(speed) MPH")
    }
    
    func speedup() {
        speed += 1
        print("Speeding up to \(speed) MPH...")
    }
    
    func slowdown() {
        speed -= 1
        print("Slowing down to \(speed) MPH...")
    }
}

let car = Vehicle(speedLimit: 65, speed: 65)
car.speedLimit = 55

struct Square {
    static let numberOfSides = 4
}
print("sides of a square: \(Square.numberOfSides)")

enum CardSuits {
    static let description = "The four suits of a deck of cards"
    case Hearts,Diamonds,Spades,Clubs
}

print("\(CardSuits.description)")

protocol ProtocolFoo{
    func foo()
}
protocol ProtocolBar {
    func bar()
}

struct Foo:ProtocolFoo,ProtocolBar {
    func foo() {
        print("foo")
    }
    func bar() {
        print("bar")
    }
}

func someMethod(composedProperty:ProtocolFoo & ProtocolBar)
{
    composedProperty.foo()
    composedProperty.bar()
}

let foo = Foo()
someMethod(composedProperty: foo)

struct Stack<T> {
    var items = [T]()
    mutating func push(item: T){
        items.append(item)
    }
    mutating func pop() -> T? {
        guard !items.isEmpty else {
            return nil
        }
        return items.removeLast()
    }
}
var myIntStack = Stack<Int>()
var myStringStack = Stack<String>()
myStringStack.push(item: "123")
myStringStack.push(item: "a")
myStringStack.push(item: "b")
myStringStack.pop()

let expenses = [21.37, 55.21, 9.32, 10.18, 388.77, 11.41]
let hasBigPurchase = expenses.contains{ $0 > 100}

struct Queue<T:Equatable> {
    private var items = [T]()
    var count:Int {
        return items.count
    }
    mutating func enqueue(item:T){
        guard (items.contains{ $0 == item
        } == false) else {
            return
        }
        items.insert(item, at: 0)
    }
    mutating func dequeue() -> T?{
        guard items.count > 0 else {
            return nil
        }
        return items.removeLast()
    }
}
var queue = Queue<Int>()
queue.enqueue(item: 1)
queue.enqueue(item: 3)
queue.enqueue(item: 5)
queue.enqueue(item: 10)
queue.dequeue()
extension Queue{
    init(array:[T]) {
        self.init()
        array.reversed().forEach {
            self.enqueue(item: $0)
        }
    }
}
let array = [1,2,3,3,4,5]
let queue2 = Queue(array: array)
print(queue2)


//protocol Flushable {
//    associatedtype ItemType
//    mutating func flush(afterNthElementFromFront index: Int) -> [ItemType]
//}
//
//protocol CollectionItemInspectable {
//    associatedtype ItemType
//    func placementFromFrontForElement(element: ItemType) -> Int?
//}
//
//extension Queue: Flushable {
//    typealias ItemType = T
//    mutating func flush(afterNthElementFromFront index: Int) -> [ItemType] {
//        let position = items.count - index
//        let result = Array(items[0..<position])
//        items[0..<position] = []
//        return result
//    }
//}
//extension Queue: CollectionItemInspectable {
////    typealias ItemType = T
//    func placementFromFrontForElement(element: ItemType) -> Int? {
//        guard let foundIndex = items.indexOf(element) else { return nil }
//        return (items.count - 1) - foundIndex
//    }
//}







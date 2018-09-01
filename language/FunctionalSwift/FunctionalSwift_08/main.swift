//
//  main.swift
//  FunctionalSwift_08
//
//  Created by yhp on 2018/8/31.
//  Copyright © 2018年 none. All rights reserved.
//

import Foundation

//  associatedtype 关联类型
protocol Food {
}

protocol Animal {
    func eat(_ food:Food)
}

struct Meat:Food {}
struct Grass:Food {}

struct Tiger:Animal {
    func eat(_ food: Food) {
        if let meat = food as? Meat {
            print("eat \(meat)")
        }else{
            fatalError("Tiger can only eat meat")
        }
    }
}

let meat = Meat()
Tiger().eat(meat)

// 这样的转换很多时候没有什么意义，而且将责任丢给了运行时
// 注意 被associatedtype 约束后不能作为独立类型占位使用，只能使用泛型
protocol Animal2 {
    associatedtype F: Food
    func eat(_ food : F)
}

struct Tiger2:Animal2 {

    func eat(_ food: Meat) {
        print("eat \(food)")
    }
}

struct Sheep:Animal2 {
    func eat(_ food: Grass) {
        print("eat \(food)")
    }
}

func isDangerous<T:Animal2>(animal:T) -> Bool {
    if animal is Tiger2 {
        return true
    }else {
        return false
    }
}

print(isDangerous(animal: Tiger2()))
print(isDangerous(animal: Sheep()))

protocol GeneratorType {
    associatedtype Element
    func next() -> Element?
}

class CountdownGenerator:  GeneratorType{
    var element :Int
    init<T>(array:[T]) {
        self.element = array.count
    }
    func next() -> Int? {
        self.element = self.element - 1
        return self.element < 0 ? nil : self.element
    }
}

let xs = ["A","B","C"]
let generator = CountdownGenerator(array: xs)

while let i = generator.next() {
    print("\(xs[i])")
}

class PowerGernerator: GeneratorType {
    var power: NSDecimalNumber = 1
    let two:NSDecimalNumber = 2
    
    init() {}
    
    func next() -> NSDecimalNumber? {
        power = power.multiplying(by: two)
        return power
    }
}

extension PowerGernerator {
    func findPower(predicate:(NSDecimalNumber) -> Bool) -> NSDecimalNumber{
        while let x = next() {
            if predicate(x){
                return x
            }
        }
        return 0
    }
}

let result = PowerGernerator().findPower { (number) -> Bool in
    return number.intValue > 10000
}
print(result)

// 知识补充之 ---- NSCharacterSet 使用
/***********************************************************/
// 删除空格符
var string = "  Lorem    ipsum dolar   sit  amet. "
let components = string.components(separatedBy: NSCharacterSet.whitespaces).filter { !$0.isEmpty}
print(components)
// 解析数据
let skippedCharacters = NSMutableCharacterSet.punctuation()


/***********************************************************/
class FileLineGenerator: GeneratorType {
    typealias Element = String
    var lines:[String] = []
    
    init(filename:String) throws {
        // 通过使用给定编码解释的给定路径上的文件读取数据而创建的字符串。
        let contents : String = try String(contentsOfFile: filename)
        let newLine = NSCharacterSet.newlines
        // 以换行符作为分割
        lines = contents.components(separatedBy: newLine)
    }
    
    func next() -> Element? {
        guard !lines.isEmpty else {
            return nil
        }
        let nextLine = lines.remove(at: 0)
        return nextLine
    }
}







//
//  main.swift
//  67_closure
//
//  Created by yhp on 2017/11/23.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

extension Int{
    func times(f:(Int)-> ()){
        print("Int")
        for i in 1...self {
            f(i)
        }
    }
}

3.times { (i:Int) in
    print(i)
}

enum Suit:String {
    case spades = "黑桃"
    case herats = "红桃"
    case clubs = "草花"
    case diamonds = "方片"
}

enum Rank:Int,CustomStringConvertible {
    case ace = 1
    case two,three,four,five,six,seven,eight,nine,ten
    case jack,queen,king
    var description: String{
        switch self {
        case .ace:
            return "A"
        case .jack:
            return "J"
        case .queen:
            return "Q"
        case .king:
            return "K"
        default:
            return String(self.rawValue)
        }
    }
}

protocol EnumeratableEnum {
    static var allValues:[Self] {get}
}

extension Suit:EnumeratableEnum {
    static var allValues:[Suit] {
        return [.spades,.herats,.clubs,.diamonds]
    }
}

extension Rank:EnumeratableEnum{
    static var allValues: [Rank]{
        return [.ace,.two,.three,.four,.five,six,.seven,.eight,.nine,
        .ten,.jack,.queen,.king]
    }
}

// 漂亮
for suit in Suit.allValues {
    for rank in Rank.allValues {
        print("\(suit.rawValue) \(rank)")
    }
}

func sum (_ n: UInt) -> UInt {
    if n == 0 {
        return 0
    }
    return n + sum(n - 1)
}
print(sum(100))

func tailSum(_ n:UInt) -> UInt {
    func sumInternal(_ n:UInt,current:UInt) -> UInt {
        if n == 0 {
            return current
        }else {
            return sumInternal(n - 1, current: current + n)
        }
    }
    return sumInternal(n, current: 0)
}

print(tailSum(1000_000))








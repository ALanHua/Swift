//
//  main.swift
//  11_subscript
//
//  Created by yhp on 2017/11/2.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

var arr = [1,2,3]
print(arr[2])
arr[2] = 4
print(arr[2])

var dic = ["cat":"mecow","goat":"mie"]
print(dic["cat"]!)

extension Array{
    subscript(input:[Int]) -> ArraySlice<Element>{
        get{
            var result = ArraySlice<Element>()
            for i in input {
                assert(1 < self.count,"index out of range")
                result.append(self[i])
            }
            return result
        }
        set{
            for(index,i) in input.enumerated(){
                 assert(1 < self.count,"index out of range")
                 self[i] = newValue[index]
//                print("i:\(i),index:\(index)")
            }
        }
    }
}

var arr2 = [1,2,3,4,5]
print(arr2[[0,2,3]])
arr2[[0,2,3]] = [-1,-3,-4]
print(arr2)



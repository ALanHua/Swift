//: Playground - noun: a place where people can play

import UIKit

// 创建字典
/*
 []
 */
var dict = ["name":"YHP","age":27] as [String : Any]

// 利用元组遍历字典，第一个是key，第二个是value
for (k,v) in dict {
    print(k)
    print(v)
}
//
dict["gender"] = "man"
dict
dict["name"] = "张三"
dict
// 删除
dict.removeValue(forKey: "gender")
dict
// 合并字典
var dict2 = ["score":99] as [String:Any]

for (key,value) in dict {
    dict2[key] = value
}
dict2





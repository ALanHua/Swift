//
//  main.swift
//  FunctionalSwift_02
//
//  Created by yhp on 2018/8/11.
//  Copyright © 2018年 none. All rights reserved.
//

import Foundation
import CoreImage
//import AppKit

typealias Filter = (CIImage) -> CIImage


/// 创建一个高斯模糊滤镜
/// - Parameter radius: 半径
/// - Returns: 滤镜
func blur(radius:Double) -> Filter {
    return { image in
        let parameters = [
            kCIInputRadiusKey:radius,
            kCIInputImageKey:image
            ] as [String : Any]
        guard let filter = CIFilter(name:  "CIGaussianBlur", withInputParameters: parameters) else {
            fatalError()
        }
        guard let outputImage = filter.outputImage else {
             fatalError()
        }
        
        return outputImage
    }
}

/// 创建一个能够在图像上覆盖纯色叠成的滤镜
/// - Parameter color:颜色
/// - Returns: 滤镜
func colorGenerator(color:CGColor) -> Filter{
    return { _ in
        let c = CIColor(cgColor: color)
        let parameters = [kCIInputColorKey:c]
        guard let filter = CIFilter(name: "CIConstantColorGenerator", withInputParameters: parameters) else {
             fatalError()
        }
        guard let outputImage = filter.outputImage else {
            fatalError()
        }
        return outputImage
    }
}

/// 创建合成滤镜
/// - Parameter overlay: 覆盖图像
/// - Returns: 滤镜
func compositeSourceOver(overlay:CIImage) -> Filter {
    return {image in
        let parameters = [
            kCIInputBackgroundImageKey:image,
            kCIInputImageKey:overlay
        ]
        
        guard let filter = CIFilter(name: "CISourceOverCompositing", withInputParameters: parameters) else {
            fatalError()
        }
        guard let outputImage = filter.outputImage else {
            fatalError()
        }
        let cropRect = image.extent
        return outputImage.cropped(to: cropRect)
    }
}

func colorOverlay(color:CGColor) -> Filter {
    return { image in
        // 先创建一个要覆盖的图像
        let overlay = colorGenerator(color: color)(image)
        // 在将这个图像覆盖到原图像的背景里
        return compositeSourceOver(overlay: overlay)(image)
    }
}

#if false
/// 这段代码只是验证语法
let url = NSURL(string: "http://image.baidu.com/search/detail?ct=503316480&z=0&ipn=false&word=%E8%88%92%E6%B7%87&step_word=&hs=0&pn=6&spn=0&di=127096064590&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&istype=0&ie=utf-8&oe=utf-8&in=&cl=2&lm=-1&st=undefined&cs=1835163801%2C1387042340&os=260751006%2C3821664135&simid=3369269936%2C151670300&adpicid=0&lpn=0&ln=2524&fr=&fmq=1533973803672_R&fm=&ic=undefined&s=undefined&se=&sme=&tab=0&width=&height=&face=undefined&ist=&jit=&cg=star&bdtype=0&oriquery=&objurl=http%3A%2F%2Fimg5q.duitang.com%2Fuploads%2Fitem%2F201405%2F16%2F20140516134733_L5zhQ.jpeg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fooo_z%26e3B17tpwg2_z%26e3Bv54AzdH3Frj5rsjAzdH3F4ks52AzdH3F8m9bam8adAzdH3F1jpwtsAzdH3F&gsm=0&rpstart=0&rpnum=0&islist=&querylist=")!
let image = CIImage(contentsOf: url as URL, options: nil)!
let blurRadius = 5.0
let overlayColor = CGColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.2)
let blureedImage = blur(radius: blurRadius)(image)
let overlaidImage = colorOverlay(color: overlayColor)(blureedImage)
print(overlaidImage)

func composeFilters(filter1:@escaping Filter,_ filter2:@escaping Filter) -> Filter {
    return {image in
        filter2(filter1(image))
    }
}

let myFitter1 = composeFilters(filter1:blur(radius: blurRadius),colorOverlay(color: overlayColor))

// MARK: 自定义运算符 需要指定 优先级组
/*
 https://developer.apple.com/documentation/swift/swift_standard_library/operator_declarations
 */
infix operator >>>: BitwiseShiftPrecedence

func >>>(filter1: @escaping Filter,filter2:@escaping Filter) -> Filter {
    return {image in
        filter2(filter1(image))
    }
}
let myFilter2 = blur(radius: blurRadius) >>> colorOverlay(color: overlayColor)
let result2 = myFilter2(image)

#endif

// 柯里化
func add1(x:Int,_ y:Int) -> Int {
    return x + y
}

func add2(x:Int) -> (Int) ->Int {
    return {y in
        return x + y
    }
}
print(add1(x: 1, 2))
print(add2(x: 1)(2))




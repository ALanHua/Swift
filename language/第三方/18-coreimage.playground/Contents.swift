//: Playground - noun: a place where people can play

import UIKit

typealias Filtter = (CIImage) -> CIImage

func blur(radius:Double) ->Filtter{
    return{imgage in
        let parameters:[String:Any] = [
            kCIInputRadiusKey : radius,
            kCIInputTimeKey   : imgage
        ]
        guard let filter = CIFilter(name:"CIGaussianBlur",withInputParameters:parameters) else { fatalError() }
        guard let outputImage = filter.outputImage else { fatalError() }
        return outputImage
    }
}
/*
func colorCenerator(color:NSColor) ->Filtter{
    return{_ in
        guard let c = CIColor(cgColor:color) else { fatalError()}
        let parameters:[String: Any] = [kCIInputColorKey:c]
        guard let filter = CIFilter(name:"CIConstantColorGenerator",withInputParameters:parameters) else { fatalError() }
        guard let outputImage = filter.outputImage else { fatalError() }
        return outputImage
    }
}*/






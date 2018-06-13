//
//  main.swift
//  69_RandomNumber
//
//  Created by yhp on 2018/6/11.
//  Copyright © 2018年 YouHuaPei. All rights reserved.
//

import Foundation

var randomNumber = 1
var continueGuessing = true
var keepPlaying = true
var input = ""

while keepPlaying{
    //    get a random number from 0 - 100
    randomNumber = Int(arc4random_uniform(101))
    print("The random number to guess is: \(randomNumber)")
    
    while continueGuessing {
        print("Pick a number between 0 and 100.")
        input = NSString(data: FileHandle.standardInput.availableData, encoding: String.Encoding.utf8.rawValue)! as String;
//        替换子字符串
        input = input.replacingOccurrences(of: "\n", with: "", options: String.CompareOptions.literal, range: nil)
        if let userGuess = Int(input) {
            if userGuess == randomNumber{
                continueGuessing = false
                print("Correct number!")
            }else if userGuess > randomNumber{
                print("You guess is too high!")
            }else{
                print("You guess is too low!")
            }
        }else{
             print("Invalid guess,please try again!")
        }
    }
    
    print ("Play Again? Y or N")
    input = NSString(data: FileHandle.standardInput.availableData, encoding: String.Encoding.utf8.rawValue)! as String
    input = input.replacingOccurrences(of: "\n", with: "", options: String.CompareOptions.literal, range: nil)
    
    if input == "N" || input == "n" {
        keepPlaying = false
    }
    
    continueGuessing = true
}

//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Martin Cordoba on 9/8/22.
//
//  For the App Brewery Bootcamp by Angela Yu.
//

import Foundation

class Question{
    private var number1: Int              // First random number to operate
    private var number2: Int              // Second random number to operate
    private var fakeResult: Int           // Random answer
    private var realResult: Int           // Random answer
    private var finalAnswer: Int          // Depending on a Bool value, equals fake or real result
    private var operatorChar: String      // Character of the operator
    private var boolSelector: Bool
    
    
    init(){
        self.number1 = Int.random(in: 0...15)
        self.number2 = Int.random(in: 0...15)
        self.fakeResult = 0
        self.realResult = 0
        self.operatorChar = "+"
        self.finalAnswer = realResult
        self.boolSelector = true
    }
    
    public func getResults(){
        let randomValue = Int.random(in: 0...2)
        
        var result: Int = 0
        var fakes: [Int] = [0,0]
        
        switch randomValue{
        case 0:
            self.operatorChar = " + "
            result = number1 + number2
            break
        case 1:
            self.operatorChar = " - "
            result = number1 - number2
            break
        default:
            self.operatorChar = " x "
            result = number1 * number2
            break
        }
        
        fakes[0] = Int.random(in: (result - 2)..<result)
        fakes[1] = Int.random(in: (result + 1)...(result + 2))
        
        self.fakeResult = fakes[Int.random(in: 0...1)]
        self.realResult = result
    }
    
    public func boolResult(){
        self.boolSelector = Bool.random()
        self.finalAnswer = boolSelector ? realResult:fakeResult
    }
    
    public func getBoolValue() -> Bool{
        return self.boolSelector
    }
    
    public func textEquation() -> String{
        return (String(number1) + operatorChar + String(number2) + " = " + String(finalAnswer))
    }
}

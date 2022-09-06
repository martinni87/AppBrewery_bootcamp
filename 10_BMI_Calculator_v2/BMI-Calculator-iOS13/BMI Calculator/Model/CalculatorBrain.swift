//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Martin Cordoba on 27/8/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    private var bmi: Bmi?
    
    mutating func calculateBMI (h: Float, w: Float){
        let bmiValue = w/pow(h,2)
        
        switch bmiValue{
        case 0..<18.5:
            bmi = Bmi(value: bmiValue, message: "You gotta eat more 🍔!", color: .systemBlue)
            break
        case 18.5..<24.9:
            bmi = Bmi(value: bmiValue, message: "Well done! Fit as a fiddle! 🏅", color: .systemGreen)
            break
        default:
            bmi = Bmi(value: bmiValue, message: "Hey! Don't worry, let's do some jogging! 🏃🏽‍♂️", color: .systemRed)
        }
    }
    
    mutating func getBmiTextValue() -> String {
        let value = self.bmi?.getValue() ?? 0.0
        let text = String(format: "%.1f", value)
        return text
    }
    
    func getBmiColor() -> UIColor{
        return bmi?.getColor() ?? .white
    }
    
    func getBmiMessage() -> String{
        return bmi?.getMessage() ?? "No value yet"
    }
    
    func getBMI() -> Bmi{
        return self.bmi!
    }
    
}

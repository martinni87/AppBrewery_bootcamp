//
//  Bmi.swift
//  BMI Calculator
//
//  Created by Martin Cordoba on 30/8/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

struct Bmi {
    private var value: Float?
    private var message: String?
    private var color: UIColor?
    
    init (value: Float, message: String, color: UIColor){
        self.value = value
        self.message = message
        self.color = color
    }
    
    func getValue() -> Float?{
        return self.value
    }
    
    func getMessage() -> String?{
        return self.message
    }
    
    func getColor() -> UIColor?{
        return self.color
    }
    
}

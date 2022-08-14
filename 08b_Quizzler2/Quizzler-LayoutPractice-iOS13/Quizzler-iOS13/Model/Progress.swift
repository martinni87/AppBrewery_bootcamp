//
//  Progress.swift
//  Quizzler-iOS13
//
//  Created by Martin Cordoba on 14/8/22.
//  For the App Brewery Bootcamp by Angela Yu.
//

import UIKit

@available(iOS 15.0, *)
struct Progress{
    private var maxTime: Int
    private var step: Int
    private var relation: Float
    private var progress: Float
    private var color: UIColor
    private var stateHidden: Bool
    
    init(){
        maxTime = 60
        step = 1
        relation = Float(step) / Float(maxTime)
        progress = 0
        color = .systemMint
        stateHidden = true
    }
    
    mutating func setProgress(_ value: Float) -> Float{
        self.progress = value
        return self.progress
    }
    
    mutating func barIsHidden(_ state: Bool) -> Bool{
        self.stateHidden = state
        return self.stateHidden
    }
    
    func getColor() -> UIColor{
        return self.color
    }
    
    mutating func updateProgressBarValue(_ maxTime: Int) -> Float{
        self.maxTime = maxTime
        self.progress += 1 / Float(self.maxTime)
        return self.progress
    }
}

//
//  QuizModel.swift
//  Quizzler-iOS13
//
//  Created by Martin Cordoba on 12/8/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox

struct QuizModel {
    
    // - MARK: Quiz Properties
    
    private var boolFinalAnswer: Bool           // This variable tells if the result of the equation is true or false to compare with the player selection
    private var points: Int                     // Points of game, accumulative, each correct answer adds 1 point
    private var mistakes: Int                   // Just for the record, is the opposite of the points
    private var rounds: Int                     // Just for the record, number of rounds played
    private var maxTimerValue: Int              // Initial and max seconds, will decrease every time the player earns 1 point
    private var counter: Int                    // Counter for the timer, value equals maxTimerValue all time
    private var timer: Timer                    // Timer to set progress bar
    
    // - MARK: Initialize
    
    init(){
        boolFinalAnswer = true
        points = 0
        mistakes = 0
        rounds = 0
        maxTimerValue = 60
        counter = maxTimerValue
        timer = Timer()
    }
    
    // - MARK: Getters
    
    func getBoolFinalAnswer() -> Bool{
        return boolFinalAnswer
    }
    func getPoints() -> Int{
        return points
    }
    func getMistakes() -> Int{
        return mistakes
    }
    func getRounds() -> Int{
        return rounds
    }
    func getMaxTimerValue() -> Int{
        return maxTimerValue
    }
    func getCounter() -> Int{
        return counter
    }
    func getTimer() -> Timer{
        return timer
    }

    // - MARK: Setters
    
    mutating func setBoolFinalAnswer(_ value: Bool){
        boolFinalAnswer = value
    }
    mutating func setPoints(_ value: Int){
        points = value
    }
    mutating func setMistakes(_ value: Int){
        mistakes = value
    }
    mutating func setRounds(_ value: Int){
        rounds = value
    }
    mutating func setMaxTimerValue(_ value: Int){
        maxTimerValue = value
    }
    mutating func setCounter(_ value: Int){
        counter = value
    }
    mutating func setTimer(_ value: Timer){
        timer = value
    }
    
    // - MARK: Methods
    
    // Testing if player answer is correct, updating self values and returning result of test type boolean.
    mutating func testAnswer(_ sender: UIButton) -> Bool{
        var test = true
        if boolFinalAnswer == (sender.tag == 1){
            test = true
            points += 1
            
            if maxTimerValue >= 15{
                maxTimerValue -= 5
            }
            else if maxTimerValue > 1{
                maxTimerValue -= 1
            }
            
        }
        else{
            test = false
            mistakes += 1
            points -= 1
        }
        
        // Reseting and updating variables for next question
        rounds += 1
//        progressBar.progress = 0
//        setBackground()
//        nextQuestion()
        timer.invalidate()
        counter = maxTimerValue
//        timerSet()
        
        return test
    }
    
    //Reseting all values
    mutating func resetAllValues(){
        boolFinalAnswer = true
        points = 0
        mistakes = 0
        rounds = 0
        maxTimerValue = 60
        counter = maxTimerValue
        timer.invalidate()
        timer = Timer()
    }
}

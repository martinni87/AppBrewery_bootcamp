//
//  Sotry.swift
//  Destini-iOS13
//
//  Created by Martin Cordoba 15/08/2022.
//  For the App Brewery Bootcamp with Angela Yu.
//

import UIKit

struct Story {
    var storyLine: String
    var choice1: String
    var choice2: String
    var nextStory: Int
    
    init(storyLine: String, choice1: String, choice2: String) {
        self.storyLine = storyLine
        self.choice1 = choice1
        self.choice2 = choice2
    }
    
    //Manual setters
    mutating func setStoryLine (_ line: String){
        self.storyLine = line
    }
    mutating func setChoice1 (_ option: String){
        self.storyLine = option
    }
    mutating func setChoice2 (_ option: String){
        self.storyLine = option
    }
    mutating func changeAll (text: String, option1: String, option2: String){
        setStoryLine(text)
        setChoice1(option1)
        setChoice2(option2)
    }
    
    //Manual getters
    func getStoryLine () -> String {
        return self.storyLine
    }
    func getChoice1 () -> String {
        return self.choice1
    }
    func getChoice2 () -> String {
        return self.choice2
    }
}

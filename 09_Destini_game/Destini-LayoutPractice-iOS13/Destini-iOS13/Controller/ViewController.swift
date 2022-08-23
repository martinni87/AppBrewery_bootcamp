//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Martin Cordoba 15/08/2022.
//  For the App Brewery Bootcamp with Angela Yu.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var gameStackView: UIStackView!
    @IBOutlet weak var storyTelling: UILabel!
    @IBOutlet weak var buttonChoiceOne: UIButton!
    @IBOutlet weak var buttonChoiceTwo: UIButton!
    
    // - MARK: My variables and constants
    var buttonHasBeenPushed = false
    let stories = [
        Story(storyLine: "You're lost in the woods. But after a short time walking, you find two roads, each in one direction. \n\n\n What will you do?",
              choice1: "Go left",
              choice2: "Go right"),
        Story(storyLine: "You chose to go left. After a while the path is getting darker and darker. \n\n\n What will you do?",
              choice1: "Go deeper into the darkness",
              choice2: "Turn back and go the other way"),
        Story(storyLine: "You chose to go right. The \"right choice, isn't it?🥁\". Now you get to what it seems an empty cottage.  \n\n\n What will you do?",
              choice1: "Get closer",
              choice2: "Keep on my way and leave... NOW!"),
    ]
    var currentStory = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameStackView.layer.opacity = 0
        gameTitle.layer.opacity = 0
        startButton.layer.opacity = 0
        
        TransitionEffect(object: gameTitle!, type: .UILabel).transitionIn()
        TransitionEffect(object: startButton!, type: .UIButton).transitionIn()
        
        storyTelling.textColor = .white
        storyTelling.text = stories[currentStory].getStoryLine()
        
        buttonChoiceOne.backgroundColor = .systemIndigo
        buttonChoiceOne.setTitle(stories[currentStory].getChoice1(), for: .normal)
        buttonChoiceOne.layer.cornerRadius = CGFloat(15)
        buttonChoiceOne.tag = 1
    
        buttonChoiceTwo.backgroundColor = .systemPurple
        buttonChoiceTwo.setTitle(stories[currentStory].getChoice2(), for: .normal)
        buttonChoiceTwo.layer.cornerRadius = CGFloat(15)
        buttonChoiceTwo.tag = 2
    }
    
    @IBAction func startButtonAction(_ sender: UIButton) {
        TransitionEffect(object: gameTitle!, type: .UILabel).transitionOut()
        TransitionEffect(object: startButton!, type: .UIButton).transitionOut()
        TransitionEffect(object: gameStackView!, type: .UIView).transitionIn()
        buttonHasBeenPushed = true
    }
    
    @IBAction func choiceMade(_ sender: UIButton) {
        sender.buttonIsPressed(sender)
        currentStory += sender.tag
        storyTelling.text = stories[currentStory].getStoryLine()
        buttonChoiceOne.setTitle(stories[currentStory].getChoice1(), for: .normal)
        buttonChoiceTwo.setTitle(stories[currentStory].getChoice2(), for: .normal)
        currentStory = 0
    }
    
    @IBAction func buttonTouchDown(_ sender: UIButton) {
        sender.alpha = 0.5
    }
    
    
}


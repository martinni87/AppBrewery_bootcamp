//
//  ViewController.swift
//  Destini-iOS13
//  Version 1.0
//  Created by Martin Cordoba 15/08/2022.
//  For the App Brewery Bootcamp with Angela Yu.
//

/*
 TODO: Basic app is done with a simple story with different paths to follow. For next version:
 It might be interesting to add three hearts up-right the view and each time
 the player dies, loses one heart.
 At the end, when the player is using google maps, there's one option that kills it,
 and the other option should show "Congratulations! You win!"
 If player loses all three lives, show "Game over... You lose!"
*/

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
    var theStory: StoryLevels = StoryLevels()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameStackView.layer.opacity = 0
        gameTitle.layer.opacity = 0
        startButton.layer.opacity = 0
        
        TransitionEffect(object: gameTitle!, type: .UILabel).transitionIn()
        TransitionEffect(object: startButton!, type: .UIButton).transitionIn()
        
        storyTelling.textColor = .white
        storyTelling.text = theStory.getCurrentStory().getStoryLine()
        
        buttonChoiceOne.backgroundColor = .systemIndigo
        buttonChoiceOne.setTitle(theStory.getCurrentStory().getChoice1().getText(), for: .normal)
        buttonChoiceOne.layer.cornerRadius = CGFloat(15)
        buttonChoiceOne.tag = 1
    
        buttonChoiceTwo.backgroundColor = .systemPurple
        buttonChoiceTwo.setTitle(theStory.getCurrentStory().getChoice2().getText(), for: .normal)
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
        
        var optionSelected = 1
        
        switch sender.tag {
        case 1: optionSelected = theStory.getCurrentStory().getChoice1().getPointer();break
        case 2: optionSelected = theStory.getCurrentStory().getChoice2().getPointer();break
        default: print("No valid selection done")
        }
        
        theStory.nextStory(selection: optionSelected)
        storyTelling.text = theStory.getCurrentStory().getStoryLine()
        buttonChoiceOne.setTitle(theStory.getCurrentStory().getChoice1().getText(), for: .normal)
        buttonChoiceTwo.setTitle(theStory.getCurrentStory().getChoice2().getText(), for: .normal)
    }
    
    @IBAction func buttonTouchDown(_ sender: UIButton) {
        sender.alpha = 0.5
    }
    
    
}


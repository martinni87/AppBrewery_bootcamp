//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Martin Cordoba at july 2022
//  This part of the AppBrewery bootcamp with Angela Yu
//
//  This apps can only be correctly seen in iPhone 11 on portrait mode

import UIKit

class ViewController: UIViewController {
    
    let possibleAnswers = [
        "Tap me!",
        "Yes",
        "Nope",
        "God will provide",
        "Hakuna Matata",
        "Follow your heart"
    ]
    
    var rounds = 0
    var initialText = ""
    var finalText = ""
    
    @IBOutlet weak var magicBallObject: UIImageView!
    @IBOutlet weak var tapButton: UIButton!
    @IBOutlet weak var mainAnswer: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapButton.setTitle("", for: .normal)
        tapButton.alpha = 0.5
        mainAnswer.isEditable = false
        mainAnswer.alpha = 0
        mainAnswer.textAlignment = .center
        
    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        showAnswer()
        print("Device's been shaked!")
    }
        
    @IBAction func tappingAction(_ sender: UIButton) {
        showAnswer()
    }
    
    func showAnswer(){
        let randomValue = Int.random(in: 1 ... 5)
        
        if rounds == 0 {
            initialText = possibleAnswers[randomValue]
            finalText = initialText
        }
        else if rounds == 20 {
            finalText = "You should rest your finger"
        }
        else if rounds == 40{
            finalText = "Seriously, stop it!"
        }
        else if rounds == 60{
            finalText = "OK, that's it!"
        }
        else if rounds == 80{
            finalText = "God! Please! Stop!"
        }
        else if rounds == 81{
            finalText = "Error 404"
        }
        else if rounds == 82{
            finalText = "Just joking ;-)"
        }
        else if rounds == 83{
            finalText = "Resetting!"
        }
        else if rounds == 84{
            finalText = "Starting again!"
            rounds = 0
        }
        else{
            initialText = possibleAnswers[randomValue]
            if initialText == finalText && randomValue < 5{
                finalText = possibleAnswers[randomValue + 1]
            }
            else if initialText == finalText && randomValue == 5{
                finalText = possibleAnswers[1]
            }
            else{
                finalText = initialText
            }
        }
        
        rounds += 1
        
        mainAnswer.text = finalText
        mainAnswer.alpha = 1
        
//        Check next to set a fade in fade out effect
//        Must not be working 'cause it's inside the "tap action"
//        So at the end, it shows the text with alpha = 0
//
//        for _ in 1 ... 10{
//            mainAnswer.alpha += 0.1
//            usleep(100000)
//            print (mainAnswer.alpha)
//        }
//        for _ in 1 ... 10{
//            usleep(100000)
//            print (mainAnswer.alpha)
//        }
//        for _ in 1 ... 10{
//            usleep(100000)
//            mainAnswer.alpha -= 0.1
//            print (mainAnswer.alpha)
//        }
    }
}

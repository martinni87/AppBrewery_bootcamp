//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceOne: UIImageView!
    @IBOutlet weak var diceTwo: UIImageView!
    @IBOutlet weak var diceThree: UIImageView!
    @IBOutlet weak var rollingButton: UIButton!
    
    let diceValuesArray = [
        UIImage(named: "DiceOne"),
        UIImage(named: "DiceTwo"),
        UIImage(named: "DiceThree"),
        UIImage(named: "DiceFour"),
        UIImage(named: "DiceFive"),
        UIImage(named: "DiceSix")
    ]

//    In this case we don't really need vewDidLoad() function, so I just comment it.
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        Next commented lines are just part of the exercise.
//        diceOne.image = UIImage(named: "DiceOne")
//        diceTwo.image = UIImage(named: "DiceTwo")
//        diceThree.image = UIImage(named: "DiceThree")
//        rollingButton.alpha = CGFloat(0.5)
//    }

    @IBAction func rollingButtonAction(_ sender: UIButton) {
        //Next commented lines are just part of the exercise.
//        print("Button has been pressed")
//        diceOne.image = .init(named: "DiceFour")
//        diceTwo.image = .init(named: "DiceFive")
//        diceThree.image = .init(named: "DiceSix")
//        rollingButton.alpha = CGFloat(1)
        diceOne.image = diceValuesArray[Int.random(in: 0...5)]
        //Other way is with .randomElement() which looks how many items we have in an array and
        //randomly choose one. This is way more efficient.
        //If we don't set .randomElement()! we get an error: Cannot assign value of type UIImage?? to type
        //UIImage?
        //With ! we confirm that this value is not going to be null.
        diceTwo.image = diceValuesArray.randomElement()!
        diceThree.image = diceValuesArray.randomElement()!
    }
    
    
}


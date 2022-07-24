//
//  ViewController.swift
//  Dice exercise from AppBrewery bootcamp
//
//  Created by Martin Cordoba on july 2022
//  Version 1.0 Only works on iPhone 11
//
//  Version 2.0 New modifications to work on more displays ratios

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceOne: UIImageView!
    @IBOutlet weak var diceTwo: UIImageView!
    @IBOutlet weak var diceThree: UIImageView!
    @IBOutlet weak var diceFour: UIImageView!
    @IBOutlet weak var diceFive: UIImageView!
    @IBOutlet weak var diceSix: UIImageView!
    @IBOutlet weak var playerPoints: UILabel!
    @IBOutlet weak var rollingButton: UIButton!
    
    let diceValuesArray = [
        UIImage(named: "DiceOne"),
        UIImage(named: "DiceTwo"),
        UIImage(named: "DiceThree"),
        UIImage(named: "DiceFour"),
        UIImage(named: "DiceFive"),
        UIImage(named: "DiceSix")
    ]
    
    var arrayOfDices: Array<UIImageView> = []
    
    
    var points = 0
    let pointsTextStandard = "Points: "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerPoints.text = pointsTextStandard + String(points)
        arrayOfDices = [
            diceOne,
            diceTwo,
            diceThree,
            diceFour,
            diceFive,
            diceSix
        ]
    }

    @IBAction func rollingButtonAction(_ sender: UIButton) {
        var randomNumber = 0
        
        //This loop takes each dice of the array and changes their values with the randomNumber generated.
        //Then it saves the randomValue to keep record of the points
        for i in 0 ... 5{
            randomNumber = Int.random(in: 1 ... 5)
            points += randomNumber + 1
            arrayOfDices[i].image = diceValuesArray[randomNumber]
        }
        
        //After each throw, the pointers are updated
        playerPoints.text = pointsTextStandard + String(points)

//        diceOne.image = diceValuesArray.randomElement()!
//        diceTwo.image = diceValuesArray.randomElement()!
//        diceThree.image = diceValuesArray.randomElement()!
//        diceFour.image = diceValuesArray.randomElement()!
//        diceFive.image = diceValuesArray.randomElement()!
//        diceSix.image = diceValuesArray.randomElement()!
    }
}


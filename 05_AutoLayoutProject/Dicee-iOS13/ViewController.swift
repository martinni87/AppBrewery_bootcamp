//
//  ViewController.swift
//  Dice exercise from AppBrewery bootcamp
//
//  Created by Martin Cordoba on july 2022
//  Version 1.0 Only works on iPhone 11 on portrait mode
//
//  Version 2.0 Now supports iPhone 11 on portrait and landscape mode
//  Also some features added, such as more dices, counting points and resetting counter

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceOne: UIImageView!
    @IBOutlet weak var diceTwo: UIImageView!
    @IBOutlet weak var diceThree: UIImageView!
    @IBOutlet weak var diceFour: UIImageView!
    @IBOutlet weak var diceFive: UIImageView!
    @IBOutlet weak var diceSix: UIImageView!
    @IBOutlet weak var playerPoints: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
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
    let endingPoints = 70
    
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
        stopButton.setTitle("STAND", for: .normal)
    }

    @IBAction func startButtonAction(_ sender: UIButton) {
        var randomNumber = 0
        stopButton.isEnabled = true
        //This loop takes each dice of the array and changes their values with the randomNumber generated.
        //Then it saves the randomValue to keep record of the points
        for i in 0 ... 5{
            randomNumber = Int.random(in: 1 ... 5)
            points += randomNumber + 1
            arrayOfDices[i].image = diceValuesArray[randomNumber]
        }
        
        //After each throw, the pointers are updated
        playerPoints.text = pointsTextStandard + String(points)
    }
    
    @IBAction func stopButtonAction(_ sender: UIButton) {
        if !startButton.isHidden{
            startButton.isHidden = true
            stopButton.setTitle("START PLAYER 2", for: .normal)
            playerPoints.text = "YOU'VE WON \(points) POINTS"
        }
        else{
            startButton.isHidden = false
            points = 0
            playerPoints.text = pointsTextStandard + String(points)
            stopButton.setTitle("STAND", for: .normal)
        }
        
    }
    
}


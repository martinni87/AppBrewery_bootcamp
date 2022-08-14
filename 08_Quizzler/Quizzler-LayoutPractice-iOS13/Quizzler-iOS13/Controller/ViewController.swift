//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Martin Cordoba on 9/8/22.
//
//  For the App Brewery Bootcamp by Angela Yu.
//

import UIKit
import QuartzCore
import AudioToolbox

class ViewController: UIViewController {
    
    // - MARK: IB Outlets
    @IBOutlet weak var backgroundPicture: UIImageView!
    @IBOutlet weak var backgroundFrame: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    // - MARK: My Variables
    var backgroundList: Array<UIImage> = []         // At viewDidLoad we load all background pictures to this Collection
    var boolFinalAnswer: Bool = true                // This variable tells if the result of the equation is true or false to compare with the player selection
    var points = 0                                  // Points of game, accumulative, each correct answer adds 1 point
    var mistakes = 0                                // Just for the record, is the opposite of the points
    var rounds = 0                                  // Just for the record, number of rounds played
    var maxTimerValue = 60                          // Initial and max seconds, will decrease every time the player earns 1 point
    var counter = 60                                // Counter for the timer, value equals maxTimerValue all time
    var timer: Timer = Timer()
    
    // - MARK: If view loads without errors
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundFrame.backgroundColor = .black
        backgroundFrame.layer.cornerRadius = CGFloat(25)
        backgroundFrame.alpha = 0.8
        
        progressBar.progressTintColor = myColor()   // Just to keep it clean. Method to check if the current version of iOS supports the color. If it does, then assign the color, if it doesn't then assigns an alternative
        progressBar.isHidden = true
        
        trueButton.backgroundColor = myColor()
        trueButton.isHidden = true
        falseButton.backgroundColor = .systemPink
        falseButton.isHidden = true
        
        questionLabel.text = "Welcome to Quizzler! Press start to begin"
        
        trueButton.tag = 1
        falseButton.tag = 0
        
        backgroundList = addBackgrounds()           //Adding backgrounds inside asset to the Collection
        setBackground()                             //Setting the current background from the Collection initialized
    }
    
    // - MARK: IB Actions
    
    @IBAction func buttonAction(_ sender: UIButton) {
             
        if boolFinalAnswer == (sender.tag == 1){
            points += 1
            sender.backgroundColor = .systemGreen
            Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(highlightButton), userInfo: nil, repeats: false)
            AudioServicesPlaySystemSoundWithCompletion(SystemSoundID(1115), nil)
            if maxTimerValue >= 15{
                maxTimerValue -= 5
            }
            else if maxTimerValue > 1{
                maxTimerValue -= 1
            }
            
        }
        else{
            mistakes += 1
            sender.backgroundColor = .systemRed
            Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(highlightButton), userInfo: nil, repeats: false)
            AudioServicesPlaySystemSoundWithCompletion(SystemSoundID(1116), nil)
            AudioServicesPlaySystemSoundWithCompletion(kSystemSoundID_Vibrate, nil)
        }
        
        // Reseting and updating variables for next question
        rounds += 1
        progressBar.progress = 0
        setBackground()
        nextQuestion()
        timer.invalidate()
        counter = maxTimerValue
        timerSet()
    }
    
    @IBAction func startRestartAction(_ sender: UIButton) { //Reseting everything for new game
        progressBar.isHidden = false
        trueButton.isHidden = false
        falseButton.isHidden = false
        startButton.isHidden = true
        
        trueButton.isEnabled = true
        falseButton.isEnabled = true

        progressBar.progress = 0
        
        points = 0
        mistakes = 0
        rounds = 0
        maxTimerValue = 60
        counter = maxTimerValue
        timer = Timer()
        
        nextQuestion()
        timer.invalidate()
        timerSet()
        
    }
    
    
    
    // - MARK: My functions
    
    @objc func highlightButton(){
        trueButton.backgroundColor = myColor()
        falseButton.backgroundColor = .systemPink
    }
    
    func myColor() -> UIColor{
        if #available(iOS 15.0, *) {
            return .systemMint
        } else {
            return .systemGreen
        }
    }
    
    func addBackgrounds() -> Array<UIImage>{
        var temp: Array<UIImage> = []
        for i in 1 ... 22{
            temp.append(UIImage(named: "pic-\(i)")!)
        }
        return temp
    }
    
    func setBackground(){
        UIView.transition(
            with: backgroundPicture,
            duration: 0.75,
            options: .transitionCrossDissolve,
            animations:
            {
                self.backgroundPicture.image = self.backgroundList[Int.random(in: 0...21)]
            },
            completion: nil)
    }
    
    func nextQuestion(){
        // Own class, must be use in this precise order to work correctly
        let newQuestion: Question = .init()
        newQuestion.getResults()
        newQuestion.boolResult()
        boolFinalAnswer = newQuestion.getBoolValue()
        questionLabel.text = newQuestion.textEquation()
    }
    
    
    // Timer set and bar progress
    func timerSet(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self , selector: #selector(timerCounter), userInfo: nil, repeats: true)
    }

    @objc func timerCounter() -> Void {
        counter -= 1
        if counter < 0{
            timer.invalidate()
            trueButton.isEnabled = false
            falseButton.isEnabled = false
            startButton.isHidden = false
            startButton.setTitle("Restart", for: .normal)
            questionLabel.text = "You're out of time!! You've got \(points) points and \(mistakes) mistakes after \(rounds) rounds!"
        }
        else{
            updateProgressBar()
        }
    }
    
    func updateProgressBar(){
        progressBar.progress += 1 / Float(maxTimerValue)
    }
}


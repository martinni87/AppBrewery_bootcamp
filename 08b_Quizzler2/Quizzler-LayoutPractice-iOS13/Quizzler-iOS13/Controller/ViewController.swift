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

@available(iOS 15.0, *)
class ViewController: UIViewController {
    
    // - MARK: IB Outlets
    @IBOutlet weak var backgroundPicture: UIImageView!
    @IBOutlet weak var backgroundFrame: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var feedBackLabel: UILabel!
    
    // - MARK: My Variables
    var myQuiz: QuizModel = QuizModel()         // Loading quiz
    var backgroundList: Array<UIImage> = []     // At viewDidLoad we load all background pictures to this Collection
    var progressBarSettings: Progress = Progress()    // An object that defines functionality for the progress bar
    
    // - MARK: If view loads without errors
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundFrame.backgroundColor = .black
        backgroundFrame.layer.cornerRadius = CGFloat(25)
        backgroundFrame.alpha = 0.8
        
        progressBar.progressTintColor = progressBarSettings.getColor()
        progressBar.isHidden = progressBarSettings.barIsHidden(true)
        
        trueButton.backgroundColor = .systemMint
        trueButton.isHidden = true
        falseButton.backgroundColor = .systemPink
        falseButton.isHidden = true
        
        scoreLabel.isHidden = true
        feedBackLabel.isHidden = true
        
        questionLabel.text = "Welcome to Quizzler! Press start to begin"
        
        trueButton.tag = 1
        falseButton.tag = 0
        
        backgroundList = addBackgrounds()           //Adding backgrounds inside asset to the Collection
        setBackground()                             //Setting the current background from the Collection initialized
    }
    
    // - MARK: IB Actions
    
    @IBAction func buttonAction(_ sender: UIButton) {
        sender.backgroundColor = .white
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(highlightButton), userInfo: nil, repeats: false)
        if myQuiz.testAnswer(sender) == true {
            feedBackLabel.isHidden = false
            feedBackLabel.text = "Correct!"
            feedBackLabel.textColor = .systemGreen
            Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(feedBackTimer), userInfo: nil, repeats: false)
//            AudioServicesPlaySystemSoundWithCompletion(SystemSoundID(1115), nil)
        }
        else{
//            AudioServicesPlaySystemSoundWithCompletion(SystemSoundID(1116), nil)
            feedBackLabel.isHidden = false
            feedBackLabel.text = "Incorrect!"
            feedBackLabel.textColor = .systemRed
            Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(feedBackTimer), userInfo: nil, repeats: false)
            AudioServicesPlaySystemSoundWithCompletion(kSystemSoundID_Vibrate, nil)
        }
             
        progressBar.progress = progressBarSettings.setProgress(0)
        setBackground()
        nextQuestion()
        myQuiz.setCounter(myQuiz.getMaxTimerValue())
        timerSet()
        scoreLabel.isHidden = false
        scoreLabel.text = "Score: \(myQuiz.getPoints())"
    }
    
    @IBAction func startRestartAction(_ sender: UIButton) { //Reseting everything for new game
        progressBar.isHidden = false
        trueButton.isHidden = false
        falseButton.isHidden = false
        startButton.isHidden = true
        
        trueButton.isEnabled = true
        falseButton.isEnabled = true

        progressBar.progress = progressBarSettings.setProgress(0)

        myQuiz.resetAllValues()
        timerSet()
        nextQuestion()
        scoreLabel.text = "Score: 0"
    }
    
    // - MARK: My functions
    
    @objc func highlightButton(){
        trueButton.backgroundColor = .systemMint
        falseButton.backgroundColor = .systemPink
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
        myQuiz.setBoolFinalAnswer(newQuestion.getBoolValue())
        questionLabel.text = newQuestion.textEquation()
    }
    
    
    // Timer set and bar progress
    func timerSet(){
        myQuiz.setTimer(Timer.scheduledTimer(timeInterval: 1, target: self , selector: #selector(timerCounter), userInfo: nil, repeats: true))
    }
    
    @objc func feedBackTimer(){
        feedBackLabel.isHidden = true
    }

    @objc func timerCounter() -> Void {
        myQuiz.setCounter(myQuiz.getCounter() - 1)
        if myQuiz.getCounter() < 0{
            trueButton.isEnabled = false
            falseButton.isEnabled = false
            startButton.isHidden = false
            startButton.setTitle("Restart", for: .normal)
            questionLabel.text = "You're out of time!! You've got \(myQuiz.getPoints()) points and \(myQuiz.getMistakes()) mistakes after \(myQuiz.getRounds()) rounds!"
            myQuiz.resetAllValues()
        }
        else{
            progressBar.progress = progressBarSettings.updateProgressBarValue(myQuiz.getMaxTimerValue())
            print("Remaining: \(myQuiz.getCounter())")
        }
    }
}


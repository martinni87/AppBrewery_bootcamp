//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
import MobileCoreServices

class ViewController: UIViewController {
    
    // - MARK: My Constants
    private let ksoftEgg = 5 * 60 //This value must be in seconds, so 5 minutes = 5 * 60
    private let kmediumEgg = 7 * 60 //This value must be in seconds, so 7 minutes = 7 * 60
    private let khardEgg = 12 * 60 //This value must be in seconds, so 12 minutes = 12 * 60
    
    // - MARK: My Variables
    private var soundPlayer: AVAudioPlayer!
    private var minutesLabel: Int = 0
    private var timer: Timer = Timer()
    private var counter: Int = 0
    private var timerIsRunning: Bool = false
    private var limitTime: Int = 0
    
    // - MARK: Interface Builder Outlets
    @IBOutlet weak var softEggButton: UIButton!
    @IBOutlet weak var mediumEggButton: UIButton!
    @IBOutlet weak var hardEggButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    
    
    // - MARK: View did load
    internal override func viewDidLoad() {
        super.viewDidLoad()
        softEggButton.alpha = 0.1
        mediumEggButton.alpha = 0.1
        hardEggButton.alpha = 0.1
        progressBar.progress = 0
        progressBar.isHidden = true
        timerLabel.isHidden = true
        stopButton.isHidden = true
    }

    // - MARK: Interface Builder Actions
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timerIsRunning = true
        
        transitionEffect(sender)
        blockAllActions(sender)
        
        progressBar.isHidden = false
        timerLabel.isHidden = false
        stopButton.isHidden = false

        setLimitTime(sender.currentTitle!)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
    }
    
    @IBAction func stopButtonAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "STOP", message: "If you STOP NOW, everything will be lost. Proceed?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "YES", style: .cancel, handler: {(_) in
            self.counter = 0
            self.timer.invalidate()
            self.timerLabel.text = self.timerString(0,0,0)
            
            self.softEggButton.alpha = 0.1
            self.mediumEggButton.alpha = 0.1
            self.hardEggButton.alpha = 0.1

            self.softEggButton.isEnabled = true
            self.mediumEggButton.isEnabled = true
            self.hardEggButton.isEnabled = true

            self.progressBar.progress = 0

            self.progressBar.isHidden = true
            self.timerLabel.isHidden = true
            self.stopButton.isHidden = true
        }))
        
        alert.addAction(UIAlertAction(title: "NO", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    // - MARK: My private functions
    
    private func runAlarm (){
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        soundPlayer = try! AVAudioPlayer(contentsOf: url!)
        soundPlayer.play()
    }
    
    func setLimitTime(_ buttonTitle: String){
        switch buttonTitle.uppercased() {
        case "SOFT": limitTime = ksoftEgg
            break
        case "MEDIUM": limitTime = kmediumEgg
            break
        case "HARD": limitTime = khardEgg
            break
        default:break
        }
    }
    
    @objc func timerCounter() -> Void {
        counter += 1
        self.updateProgressBar()
        let time = secondsMinutesHours(counter)
        let timeString = timerString(time.0, time.1, time.2)
        self.timerLabel.text = timeString
        if counter == limitTime {
            runAlarm()
            timer.invalidate()
        }
        
        
    }
    private func updateProgressBar(){
        let progress: Float = 1 / Float(limitTime)
        self.progressBar.progress += progress
    }
    
    func secondsMinutesHours (_ seconds: Int) -> (Int, Int, Int) { //seconds, minutes and hours
        return ((seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    
    func timerString (_ hours: Int, _ minutes: Int, _ seconds: Int) -> String {
        var timeString = ""
        
        //timeString += String(format: "%02d", hours) + ":"
        timeString += String(format: "%02d", minutes) + ":"
        timeString += String(format: "%02d", seconds)
        
        return timeString
    }
    
    private func transitionEffect(_ button: UIButton){
        for i in 1 ... 9{
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(i)/10){ //Double(i)/10 solves the problem!
                button.alpha += 0.1
            }
        }
    }
    
    private func blockAllActions(_ selectedButton: UIButton){
        // All three buttons are toggled disabled
        softEggButton.isEnabled = false;
        mediumEggButton.isEnabled = false;
        hardEggButton.isEnabled = false;
        
        // Unselected buttons turn to alpha = 0
        switch selectedButton.currentTitle?.uppercased(){
            case "SOFT":
                mediumEggButton.alpha = 0
                hardEggButton.alpha = 0
                break
            case "MEDIUM":
                softEggButton.alpha = 0
                hardEggButton.alpha = 0
                break
            case "HARD":
                softEggButton.alpha = 0
                mediumEggButton.alpha = 0
                break
            default:break
        }
    }
}

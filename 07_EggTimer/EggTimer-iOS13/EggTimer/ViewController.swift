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
    private let ksoftEgg = 1 //This value must be in seconds, so 5 minutes = 5 * 60
    private let kmediumEgg = 7 //This value must be in seconds, so 7 minutes = 7 * 60
    private let khardEgg = 12 //This value must be in seconds, so 12 minutes = 12 * 60
    let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    
    // - MARK: My Variables
    private var soundPlayer: AVAudioPlayer!
    private var currentTime: Double = 0
    private var timerViewMinutes: Int = 0
    private var timerViewSeconds: Int = 0
    
    // - MARK: Interface Builder Outlets
    @IBOutlet weak var softEggButton: UIButton!
    @IBOutlet weak var mediumEggButton: UIButton!
    @IBOutlet weak var hardEggButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var timerView: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    
    
    // - MARK: View did load
    internal override func viewDidLoad() {
        super.viewDidLoad()
        softEggButton.alpha = 0.1
        mediumEggButton.alpha = 0.1
        hardEggButton.alpha = 0.1
        progressBar.progress = 0
        progressBar.isHidden = true
        timerView.isHidden = true
        stopButton.isHidden = true
    }

    // - MARK: Interface Builder Actions
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let delay = timerSelection(sender.currentTitle!)
        let timer: DispatchTime = DispatchTime.now() + delay
        
        DispatchQueue.main.asyncAfter(deadline: timer){
            self.runAlarm()
        }
        // TODO: Pending how to reset current alarm
//        stopButton.isHidden = false
//        stopButton.titleLabel?.textColor = .white
//        stopButton.backgroundColor = .systemRed
//        stopButton.titleLabel?.font = .systemFont(ofSize: 30, weight: .bold)
        transitionEffect(sender)
        blockAllActions(sender)
        setProgressBar(delay)

    }
    
    @IBAction func stopButtonAction(_ sender: UIButton) {
        currentTime = 0
        timerViewMinutes = 0
        timerViewSeconds = 0

        softEggButton.alpha = 0.1
        mediumEggButton.alpha = 0.1
        hardEggButton.alpha = 0.1

        softEggButton.isEnabled = true
        mediumEggButton.isEnabled = true
        hardEggButton.isEnabled = true

        progressBar.progress = 0

        progressBar.isHidden = true
        timerView.isHidden = true
        stopButton.isHidden = true

        // TODO: Pending how to reset current alarm
    }
    
    
    // - MARK: My private functions
    
    private func runAlarm (){
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        soundPlayer = try! AVAudioPlayer(contentsOf: url!)
        soundPlayer.play()
        print("Alarm is running")
    }
    
    private func timerSelection (_ userSelection: String) -> Double{
        var time:Int = 0
        switch userSelection.uppercased() {
        case "SOFT": time = ksoftEgg * 60; timerViewMinutes = ksoftEgg; break
        case "MEDIUM": time = kmediumEgg * 60; timerViewMinutes = kmediumEgg; break
        case "HARD": time = khardEgg * 60; timerViewMinutes = khardEgg; break
        default: print("No selection");break
        }
        return Double(time)
    }
    
    private func transitionEffect(_ button: UIButton){
//        let seconds = 0.1
//        let dispatchTime: DispatchTime = DispatchTime.now()
//
//         The next 9 dispatches should be inside a loop, but dispatchQueue (with the main method asyncAfter) saves the work to a queue
//         to execute it later, so it never enters the loop. Instead it save what work should be done and how many times, and execute everything
//         right away when the queue is empty, with no time space between each execution (i.e. 9 executions in a for _ in 1 ... 9)
//         That's the reason why there're copied 9 times the same code. It's a bit dirty so it should be improved some time.
//
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.10) {
//            button.alpha += 0.1
//        }
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.15) {
//            button.alpha += 0.1
//        }
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.20) {
//            button.alpha += 0.1
//        }
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.25) {
//            button.alpha += 0.1
//        }
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.30) {
//            button.alpha += 0.1
//        }
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.35) {
//            button.alpha += 0.1
//        }
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.40) {
//            button.alpha += 0.1
//        }
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.45) {
//            button.alpha += 0.1
//        }
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.50) {
//            button.alpha += 0.1
//        }
//    }
     
        /*
         PROBLEM SOLVED: solution is to set a variable time for the dispatch inside the loop. Otherwhise it will take
         the same dispatch time for every work that puts in queue, without waiting for execution.
         */
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
        switch selectedButton.currentTitle{
        case "Soft":
            mediumEggButton.alpha = 0
            hardEggButton.alpha = 0
            break
        case "Medium":
            softEggButton.alpha = 0
            hardEggButton.alpha = 0
            break
        case "Hard":
            softEggButton.alpha = 0
            mediumEggButton.alpha = 0
            break
        default:break
        }
    }
    @objc func fireTimer(timer: Timer) {
        print("Timer fired!")
        runCount += 1

        if runCount == 3 {
            timer.invalidate()
        }
    }
    
    private func setProgressBar(_ time:Double){
    }
    
    // Function to set the progress bar according to the actual timer selected. Must work alongside setChronometer function to work properly.
    
//    private func setProgressBar(_ time: Double){ //TODO: For some reason it's not quite on time, must work on this later.
//        let totalTime = time
//        let variation = 1.0
//        let startingTime: DispatchTime = DispatchTime.now()
//
//
//        progressBar.isHidden = false
//        timerView.isHidden = false
//
//        timerView.text = String("\(timerViewMinutes):\(timerViewSeconds)")
//
//        repeat{
//            DispatchQueue.main.asyncAfter(deadline: startingTime + self.currentTime){
//                self.progressBar.progress += Float(variation/totalTime)
//                self.setChronometer(self.timerView.text!) //To set the chronometer
//            }
//            self.currentTime += 1 //Adds 1 second
//        }while self.currentTime < totalTime
//    }
    
    //This function must work always alongside the setProgressBar function. This is MANDATORY for it to work properly
    
//    private func setChronometer(_ timerText: String){
//        timerViewSeconds -= 1
//
//
//        if timerViewMinutes == 0 && timerViewSeconds < 0{
//            timerView.text = String("00:00")
//        }
//        else if timerViewMinutes > 0 && timerViewSeconds < 0{
//            timerViewSeconds = 59
//            timerViewMinutes -= 1
//            timerView.text = String("\(timerViewMinutes):\(timerViewSeconds)")
//        }
//        else if timerViewSeconds < 10{
//            timerView.text = String("\(timerViewMinutes):0\(timerViewSeconds)")
//        }
//        else{
//            timerView.text = String("\(timerViewMinutes):\(timerViewSeconds)")
//        }
//    }
}

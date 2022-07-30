//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
//        This is what I did at first to call the func in each case...
//        BUT, see a few lines above uncommented...
//
//        switch sender.currentTitle!{
//        case "C": playSound("C");break
//        case "D": playSound("D");break
//        case "E": playSound("E");break
//        case "F": playSound("F");break
//        case "G": playSound("G");break
//        case "A": playSound("A");break
//        case "B": playSound("B");break
//        default:break;
//        }
        
        playSound(sender.currentTitle!)
        dimButton(sender)
    }
    
    private func playSound(_ note: String){
        let url = Bundle.main.url(forResource: note, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    private func dimButton(_ key: UIButton){
        print("START")
        key.alpha = 0.5
        
        let seconds = 0.15
        let dispatchTime: DispatchTime = DispatchTime.now() + seconds
        
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.undimButton(key)
        }
        
    }
    
    private func undimButton(_ key: UIButton){
        print("END")
        key.alpha = 1.0
    }
        
    
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//            sender.alpha = 1.0
//        }
}


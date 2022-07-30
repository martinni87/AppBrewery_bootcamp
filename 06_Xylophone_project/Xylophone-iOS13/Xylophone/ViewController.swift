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

    @IBOutlet weak var cKeyButton: UIButton!
    @IBOutlet weak var dKeyButton: UIButton!
    @IBOutlet weak var eKeyButton: UIButton!
    @IBOutlet weak var fKeyButton: UIButton!
    @IBOutlet weak var gKeyButton: UIButton!
    @IBOutlet weak var aKeyButton: UIButton!
    @IBOutlet weak var bKeyButton: UIButton!
    
    
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
    }
    
    private func playSound(_ note: String){
        let url = Bundle.main.url(forResource: note, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    private func dimButton(_ key: String){
        aKeyButton
    }
    
    

}


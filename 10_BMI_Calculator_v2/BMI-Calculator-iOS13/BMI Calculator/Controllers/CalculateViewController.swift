//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightValueLabel: UILabel!
    @IBOutlet weak var weightValueLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var calculateButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func heightSliderAction(_ sender: UISlider) {
        heightValueLabel.text = String(format: "%.2f", sender.value) + "m"
    }
    
    @IBAction func weightSliderAction(_ sender: UISlider) {
        weightValueLabel.text = String(format: "%.0f", sender.value) + "kg"
    }
    
    @IBAction func calulateButtonAction(_ sender: UIButton) {
        calculatorBrain.calculateBMI(h: heightSlider.value, w: weightSlider.value)
        performSegue(withIdentifier: "goToResults", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmi = calculatorBrain
        }
    }
}


//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
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
        let height = heightSlider.value
        let weight = weightSlider.value
        let bmi = weight/pow(height,2)
        print(String(format: "%.2f", bmi))
    }
}


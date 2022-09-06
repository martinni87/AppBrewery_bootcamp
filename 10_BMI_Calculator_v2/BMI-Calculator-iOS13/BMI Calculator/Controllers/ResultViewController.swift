//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Martin Cordoba on 27/8/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet var viewSettings: UIView!
    
    var bmi: CalculatorBrain?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = bmi?.getBmiTextValue()
        messageLabel.text = bmi?.getBmiMessage()
        viewSettings.backgroundColor = bmi?.getBmiColor()
    }
    
    @IBAction func recalculateButtonAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }

}

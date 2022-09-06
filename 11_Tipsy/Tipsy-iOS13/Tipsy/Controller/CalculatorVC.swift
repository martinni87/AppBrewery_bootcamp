//
//  ViewController.swift
//  Tipsy
//
//  Created by Martin Cordoba on September 6th 2022
//  For The App Brewery Bootcamp with Angela Yu.
//

import UIKit

class CalculatorVC: UIViewController {
    // - MARK: IBOutlets
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    // - MARK: Variables
    var tipValue = 0.1
    var splitNumber = 2.0
    var inputValue = 0.0
    
    // - MARK: Constants
    let kDecimalSeparator = Locale.current.decimalSeparator!
    
    // - MARK: View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        zeroPctButton.tag = 0
        tenPctButton.tag = 10
        twentyPctButton.tag = 20
        
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        if billTextField.isEditing{
            billTextField.endEditing(true)
        }
        
        tipValue = Double(sender.tag)/100
        switch sender.tag{
        case 0:
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            break
        case 10:
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            break
        default:
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
        }
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        if billTextField.isEditing{
            billTextField.endEditing(true)
        }
        
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        splitNumber = sender.value
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        var tempValue: String
        tempValue = billTextField.text!
        if let _ = tempValue.firstIndex(of: ","){
            if kDecimalSeparator == ","{
                tempValue.insert(".", at: tempValue.firstIndex(of: ",")!)
                tempValue.remove(at: tempValue.firstIndex(of: ",")!)
            }
        }
        inputValue = Double(tempValue) ?? 0.0
        
        let result = (inputValue + inputValue * tipValue) / splitNumber
        var resultText = String(format:"%.2f",result)
        resultText.insert(",", at: resultText.firstIndex(of: ".")!)
        resultText.remove(at: resultText.firstIndex(of: ".")!)
        print(resultText)
        
        performSegue(withIdentifier: "ShowResult", sender: sender)
    }
}


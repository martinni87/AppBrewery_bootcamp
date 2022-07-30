//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//
//  VERSION 2.0 In this version I try to solve some issues found in the v1.0 in which app didn't get to work properly


import UIKit

class ViewController: UIViewController {
    
    // - MARK: @IBOutlets Numpad
    
    @IBOutlet weak var number0: UIButton!
    @IBOutlet weak var number1: UIButton!
    @IBOutlet weak var number2: UIButton!
    @IBOutlet weak var number3: UIButton!
    @IBOutlet weak var number4: UIButton!
    @IBOutlet weak var number5: UIButton!
    @IBOutlet weak var number6: UIButton!
    @IBOutlet weak var number7: UIButton!
    @IBOutlet weak var number8: UIButton!
    @IBOutlet weak var number9: UIButton!
    
    // - MARK: @IBOutlets Operators
    
    @IBOutlet weak var equalButton: UIButton!
    @IBOutlet weak var additionButton: UIButton!
    @IBOutlet weak var subtractionButton: UIButton!
    @IBOutlet weak var multiplicationButton: UIButton!
    @IBOutlet weak var divisionButton: UIButton!
    @IBOutlet weak var percentageButton: UIButton!
    
    // - MARK: @IBOutlets Modifiers
    @IBOutlet weak var decimalButton: UIButton!
    @IBOutlet weak var plusMinusModifier: UIButton!
    @IBOutlet weak var allClearButton: UIButton!
    
    // - MARK: @IBOutlets Display
    @IBOutlet weak var uiDisplay: UILabel!
    
    // - MARK: My constants
    private var numpadArrayTags: Array<UIButton> = []
    private enum operators{case none,add,sub,mul,div}
    
    // - MARK: My variables
    private var total: Double = 0
    private var tempNumber: Double = 0
    private var selectedOP: operators = .none
    private var startNewNumber: Bool = true
    private var isDecimal: Bool = false
    
    // - MARK: VIEWDIDLOAD
    override func viewDidLoad() {
        //Loading view
        super.viewDidLoad()
        
        //Setting numpad tags
        var i: Int = 0
        numpadArrayTags = [number0, number1, number2, number3, number4, number5, number6, number7, number8, number9]
        for button in numpadArrayTags{
            button.tag = i
            i += 1
        }
        
        //Value for decimal button to work along with numpad functions
        decimalButton.tag = 10
        
        //Screen value in text
        uiDisplay.text = "0"
    }

    // - MARK: @IBActions NumPad
    @IBAction func numPadAction(_ sender: UIButton) {
        if allClearButton.titleLabel!.text == "AC"{
            allClearButton.setTitle("C", for: .normal)
        }
        
        if startNewNumber && sender.tag == 10 && !isDecimal{
            uiDisplay.text! = "0."
            isDecimal = true
            startNewNumber = false
        }
        else if sender.tag == 10 && !isDecimal{
            uiDisplay.text! += "."
            isDecimal = true
            startNewNumber = false
        }
        else if startNewNumber{
            uiDisplay.text! = String(sender.tag)
            startNewNumber = false
        }
        else{
            if sender.tag != 10{
                uiDisplay.text! += String(sender.tag)
            }
        }
        
        tempNumber = Double(uiDisplay.text!)!
    }
    
    // - MARK: @IBActions Operators
    @IBAction func additionAction(_ sender: UIButton) {
        operationState()
        selectedOP = .add
    }
    
    @IBAction func subtractionAction(_ sender: UIButton) {
        operationState()
        selectedOP = .sub
    }
    
    @IBAction func multiplicationAction(_ sender: UIButton) {
        operationState()
        selectedOP = .mul
    }
    
    @IBAction func divisionAction(_ sender: UIButton) {
        operationState()
        selectedOP = .div
    }
    
    @IBAction func equalAction(_ sender: UIButton) {
        showResult()
    }
    
    // - MARK: @IBActions Modifiers
    
    @IBAction func allClearAction(_ sender: UIButton) {
        clear()
    }
    
    @IBAction func togglePositiveNegative(_ sender: UIButton) {
        tempNumber *= (-1)
        uiDisplay.text! = String(tempNumber)
    }
    
    @IBAction func percentageAction(_ sender: UIButton) {
        tempNumber = tempNumber / 100
        uiDisplay.text! = String(tempNumber)
    }
    
    // - MARK: Private functions
    
    //Function to clear display. On double click clears all values
    private func clear(){
        if allClearButton.titleLabel!.text == "C"{
            allClearButton.setTitle("AC", for: .normal)
            tempNumber = 0
        }
        else{
            total = 0
            selectedOP = .none
            
        }
        uiDisplay.text! = "0"
        startNewNumber = true
        isDecimal = false
    }
    
    private func operationState(){
        if selectedOP == .none{
            total = tempNumber
        }
        else{
            performPendingOperation()
            uiDisplay.text! = String(total)
        }
        startNewNumber = true
        isDecimal = false
    }
    
    //Function to get all results
    private func performPendingOperation(){
        switch selectedOP {
        case .none:
            total = tempNumber
            break
        case .add:
            total += tempNumber
            break
        case .sub:
            total -= tempNumber
            break
        case .mul:
            total *= tempNumber
            break
        case .div:
            total /= tempNumber
            break
        }
    }
    
    private func showResult(){
        performPendingOperation()
        selectedOP = .none
        uiDisplay.text! = String(total)
        tempNumber = total
        startNewNumber = true
        isDecimal = false
    }
}


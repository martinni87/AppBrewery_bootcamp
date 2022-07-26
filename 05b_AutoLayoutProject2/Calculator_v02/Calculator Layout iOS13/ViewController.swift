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
    
    // - MARK: My constants
    
    private let kdecimalSeparator = Locale.current.decimalSeparator!    //Decimal separator symbol by current localtion.
    private let kMaxLength = 9                                          //Max length of a number.
    private let kMaxValue = 999999999
    private let kMinValue = 0.00000001
        
    private enum operationType{
        case none, addition, subtraction, multiplication, division, percentage
    }
    
    // - MARK: My variables
    
    private var numpadArrayTags: Array<UIButton> = []       //To assign tags with for loop in viewDidLoad()
    private var temp: Double = 0                            //Shows on display value
    private var total: Double = 0                           //Total of operations
    private var isOperating: Bool = false                   //Turns true when user press an operation button
    private var isDecimal: Bool = false                     //Turns true when user press decimal separator button
    private var operation: operationType = .none     //By default there's no operation, it changes when the user selects an operation to perform. See enum options above.
    
    // - MARK: Formatters
    
    //Aux value formatter
    private let auxFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    //Default display value formatter
    private var printFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = locale.groupingSeparator
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 9
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 8
        return formatter
    }()
    
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
    
    @IBOutlet weak var buttonEqual: UIButton!
    @IBOutlet weak var buttonAddition: UIButton!
    @IBOutlet weak var buttonSubtraction: UIButton!
    @IBOutlet weak var buttonMultiplication: UIButton!
    @IBOutlet weak var buttonDivision: UIButton!
    @IBOutlet weak var buttonPercentage: UIButton!
    
    // - MARK: @IBOutlets Modifiers
    @IBOutlet weak var numberDecimal: UIButton!
    @IBOutlet weak var buttonPlusMinus: UIButton!
    @IBOutlet weak var buttonAllClear: UIButton!
    
    // - MARK: @IBOutlets Display
    @IBOutlet weak var display: UILabel!
    
    // - MARK: VIEWDIDLOAD
    override func viewDidLoad() {
        //Loading view
        super.viewDidLoad()
        
        //Setting numpad tags
        numpadArrayTags = [number0, number1, number2, number3, number4, number5, number6, number7, number8, number9]
        for i in 0 ... 9{
            numpadArrayTags[i].tag = i
        }
        
        //Screen value in text
        display.text = "0"
        
        //Update number decimal symbol by de current locale
        numberDecimal.setTitle(kdecimalSeparator, for: .normal)
        
        result()
        
    }

    // - MARK: @IBActions NumPad
    @IBAction func numPadAction(_ sender: UIButton) {
        //When number starts to be written, AC turns C to clear current display but not everything
        buttonAllClear.setTitle("C", for: .normal)
        
        //Saving display value in currentTemp
        var currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        
        if !isOperating && currentTemp.count >= kMaxLength{
            return //Do nothing
        }
        
        if isOperating{
            total = (total == 0 ? temp : total)
            display.text = ""
            currentTemp = ""
            isOperating = false
        }
        
        if isDecimal{
            currentTemp += kdecimalSeparator
            isDecimal = false
        }
        
        let number = sender.tag
        
        temp = Double(currentTemp + String(number))!
        
        display.text = String(temp)
        
        print(sender.tag)
//        print(sender.tag) //This is to debug the button pressed
//        if Double(screenValue.text ?? "0") == 0{
//            //Do nothing...
////            currentNumber = Double(sender.tag)
//        }
//        if display.text?.first != "0"{
//            display.text! += String(sender.tag)
//            print(sender.tag)
////            currentNumber = (Double(screenValue.text!) ?? 0) * 10 + Double(sender.tag)
//        }
//        temp = Double(display.text!) ?? 0
////        screenValue.text = String(currentNumber)
//        print(temp)
        
    }
    
    // - MARK: @IBActions Operators
    @IBAction func additionAction(_ sender: UIButton) {
        if isOperating{
            result()
        }
        isOperating = true
        operation = .addition
        result()
    }
    @IBAction func subtractionAction(_ sender: UIButton) {
        if isOperating{
            result()
        }
        isOperating = true
        operation = .subtraction
        result()
    }
    @IBAction func multiplicationAction(_ sender: UIButton) {
        if isOperating{
            result()
        }
        isOperating = true
        operation = .multiplication
        result()
    }
    @IBAction func divisionAction(_ sender: UIButton) {
        if isOperating{
            result()
        }
        isOperating = true
        operation = .division
        result()
    }
    @IBAction func equalAction(_ sender: UIButton) {
        result()
    }
    
    // - MARK: @IBActions Modifiers
    
    @IBAction func allClearAction(_ sender: UIButton) {
        clear()
    }
    @IBAction func togglePositiveNegative(_ sender: UIButton) {
        temp = temp * (-1)
        display.text = printFormatter.string(from: NSNumber(value: temp))
    }
    @IBAction func percentageAction(_ sender: UIButton) {
        if isOperating {
            result()
        }
        isOperating = true
        operation = .percentage
        result()
    }
    @IBAction func decimalSeparatorAction(_ sender: UIButton) {
        if !isDecimal{
            //Saving temp value formatted into currentTemp (an auxiliar local constant)
            let currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
            
            if !isOperating && currentTemp.count >= kMaxLength {
                return //Do nothing if is not an operation going on and we already are at maximum number length
            }
            else{
                //Other case:
                display.text = display.text! + kdecimalSeparator
                isDecimal = true
            }
        }
    }
    
    // - MARK: Private functions
    
    //Function to clear display. On double click clears all values
    private func clear(){
        operation = .none
        buttonAllClear.setTitle("AC", for: .normal)
        if temp != 0 {
            temp = 0
            display.text = "0"
            isDecimal = false
        }
        else if temp == 0 && isDecimal {
            display.text = "0"
            isDecimal = false
        }
        else{
            total = 0
            result() //Because this uses operation = .none and total = 0, with this we reset all the calculations in func result()
        }
    }
    
    //Function to get all results
    private func result(){
        switch operation {
        case .none:
            //Do nothing
            break
        case .addition:
            total += temp
            break
        case .subtraction:
            total -= temp
            break
        case .multiplication:
            total *= temp
            break
        case .division:
            total /= temp
            break
        case .percentage:
            temp = temp / 100
            total = temp
            break
        }
        
        //Show values on display
        if Int(total) <= kMaxValue && total >= kMinValue {
            display.text = printFormatter.string(from: NSNumber(value: total))
        }
        print("Total: \(total)")
        isOperating = false
        isDecimal = false
        operation = .none
    }
    
    
    
}


//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // - MARK: My own properties
        
    enum operationToDo{
        case addition
        case subtraction
        case multiplication
        case division
        case percentage
        case togglePositiveNegative
        case allClear
    }
    
    var numpadArrayTags: Array<UIButton> = []
    
    var operatorsTags: Array<UIButton> = []
    
    // - MARK: Interface Builder Outlets
    
    // - MARK: Numpad Objects
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
    @IBOutlet weak var numberDecimal: UIButton!
    
    // - MARK: Operator Objects
    @IBOutlet weak var buttonEqual: UIButton!
    @IBOutlet weak var buttonAddition: UIButton!
    @IBOutlet weak var buttonSubtraction: UIButton!
    @IBOutlet weak var buttonMultiplication: UIButton!
    @IBOutlet weak var buttonDivision: UIButton!
    
    // - MARK: Modifier Objects
    @IBOutlet weak var buttonPercentage: UIButton!
    @IBOutlet weak var buttonPlusMinus: UIButton!
    @IBOutlet weak var buttonAllClear: UIButton!
    
    // - MARK: Display screen
    @IBOutlet weak var screenResult: UILabel!
    
    // - MARK: View Did Load
    override func viewDidLoad() {
        //Loading view
        super.viewDidLoad()
        
        //Setting numpad tags
        numpadArrayTags = [number0, number1, number2, number3, number4, number5, number6, number7, number8, number9]
        for i in 0 ... 9{
            numpadArrayTags[i].tag = i
        }
        
        //Setting operators tags
        operatorsTags = [buttonEqual,buttonAddition,buttonSubtraction,buttonMultiplication,buttonDivision]
        for i in 0 ... 4{
            operatorsTags[i].tag = i
        }
        
    }

    // - MARK: Interface Builder Action
    
    // - MARK: NumPad Action to register numbers
    @IBAction func numPadAction(_ sender: UIButton) {
        print("Numbers")
        print(sender.tag) //This is to debug the button pressed
    }
    
    // - MARK: Operators Action
    @IBAction func operatorsAction(_ sender: UIButton){
        print("Operators")
        print(sender.tag)
    }
    
}


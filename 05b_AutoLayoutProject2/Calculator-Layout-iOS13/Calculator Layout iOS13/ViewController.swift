//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let numPadValue = [0,1,2,3,4,5,6,7,8,9]
    
    enum operationToDo{
        case addition
        case subtraction
        case multiplication
        case division
        case percentage
        case togglePositiveNegative
        case allClear
    }
    
    @IBOutlet weak var resultDisplay: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


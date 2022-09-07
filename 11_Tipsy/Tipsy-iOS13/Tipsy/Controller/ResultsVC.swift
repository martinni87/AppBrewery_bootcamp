//
//  ResultsVC.swift
//  Tipsy
//
//  Created by Martin Cordoba on 6/9/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsVC: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!

    // - MARK: Variables
    var totalSplit = 0.0
    var tipValue = 0.1
    var splitNumber = 2.0

    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", totalSplit)
        settingsLabel.text = "Split between \(String(format: "%0.f",splitNumber)) people, with \(tipValue*100)% tip."
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}

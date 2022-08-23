//
//  ButtonGlow.swift
//  Destini-iOS13
//
//  Created by Martin Cordoba on 23/8/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

extension UIButton {
    
    func buttonIsPressed (_ sender: UIButton){
        sender.alpha = 0.5
        UIView.transition(
            with: sender,
            duration: TimeInterval(0.25),
            options: .init(),
            animations: {
                sender.alpha = 1
            },
            completion: nil)
    }
}

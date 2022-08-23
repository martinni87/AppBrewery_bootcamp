//
//  TransitionEffect.swift
//  Destini-iOS13
//
//  Created by Martin Cordoba on 15/8/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct TransitionEffect{
    private var timeInterval: TimeInterval // Seconds
    private let object: Any
    enum Types {
        case UILabel, UIButton, UIView
    }
    private var typeUsed: Types

    init(object: Any, type: Types){
        self.timeInterval = 2
        self.object = object
        self.typeUsed = type
    }
    
    func transitionIn(){
        switch typeUsed {
        case .UILabel:
            UIView.transition(
                with: (self.object as! UILabel),
                duration: self.timeInterval,
//                options: [.transitionCrossDissolve, .allowUserInteraction],
                options: .transitionCrossDissolve,
                animations:
                {
                    (self.object as! UILabel).layer.opacity = 1
                },
                completion: nil)
            break
        case .UIButton:
            UIView.transition(
                with: (self.object as! UIButton),
                duration: self.timeInterval,
//                options: [.transitionCrossDissolve, .allowUserInteraction],
                options: .transitionCrossDissolve,
                animations:
                {
                    (self.object as! UIButton).layer.opacity = 1
                },
                completion: nil)
            break
        case .UIView:
            UIView.transition(
                with: (self.object as! UIView),
                duration: self.timeInterval,
//                options: [.transitionCrossDissolve, .allowUserInteraction],
                options: .transitionCrossDissolve,
                animations:
                {
                    (self.object as! UIView).layer.opacity = 1
                },
                completion: nil)
        }

    }
    
    func transitionOut(){
        switch typeUsed {
        case .UILabel:
            UIView.transition(
                with: (self.object as! UILabel),
                duration: self.timeInterval,
                options: .transitionCrossDissolve,
                animations:
                {
                    (self.object as! UILabel).layer.opacity = 0
                },
                completion: nil)
            break
        case .UIButton:
            UIView.transition(
                with: (self.object as! UIButton),
                duration: self.timeInterval,
                options: .transitionCrossDissolve,
                animations:
                {
                    (self.object as! UIButton).layer.opacity = 0
                },
                completion: nil)
            break
        case .UIView:
            UIView.transition(
                with: (self.object as! UIView),
                duration: self.timeInterval,
                options: .transitionCrossDissolve,
                animations:
                {
                    (self.object as! UIView).layer.opacity = 0
                },
                completion: nil)
        }
    }
}

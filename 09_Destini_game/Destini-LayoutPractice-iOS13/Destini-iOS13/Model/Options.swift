//
//  Options.swift
//  Destini-iOS13
//
//  Created by Martin Cordoba on 25/8/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

struct Options {
    private var text: String
    private var pointer: Int
    
    init(t: String, p: Int){
        text = t
        pointer = p
    }
    
    func getPointer() -> Int{
        return self.pointer
    }
    func getText() -> String{
        return self.text
    }

}

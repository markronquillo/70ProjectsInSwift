//
//  Tip.swift
//  TipCalculator
//
//  Created by Mark Ronquillo on 12/10/2016.
//  Copyright © 2016 Mark Ronquillo. All rights reserved.
//

import Foundation

struct Tip {
    var amount : Double
    var tipPercentage: Double
    
    var tipAmount : Double {
        get {
            return amount * tipPercentage
        }
    }
    
    var totalAmount : Double {
        get {
            return tipAmount + amount
        }
    }
}

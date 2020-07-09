//
//  TipCalculator.swift
//  Tipsies
//
//  Created by Pranavi Parsi on 7/8/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import Foundation

class TipCalculator{
    var amountBeforeTip: Double = 0
    var tipAmount: Double = 0
    var tipPercentage: Double = 0
    var totalAmount: Double = 0
    
    init(amountBeforeTip: Double, tipPercentage: Double) {
        self.amountBeforeTip = amountBeforeTip
        self.tipPercentage = tipPercentage
    }
    
    func calculateTip() {
        tipAmount = amountBeforeTip * tipPercentage
        totalAmount = tipAmount + amountBeforeTip
    }
}

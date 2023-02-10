//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Saurabh Mirajkar on 10/02/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    var split: Split?
    
    mutating func calculateBill(tipPercentage: String, billAmount: String?, splitCount: Int) {
        let tipValue = tipPercentage.replacingOccurrences(of: "%", with: "")
        let tip = (Double(tipValue) ?? 0.0) / 100.0
        let billAmount = Double(billAmount ?? "0.0") ?? 0
        let result = (billAmount + (billAmount * tip)) / Double(splitCount)
        split = Split(totalAmount: result, tipPercentage: tipPercentage, numberOfPeople: splitCount)
    }
    
    func retrieveBill () -> Split? {
        return split
    }
}

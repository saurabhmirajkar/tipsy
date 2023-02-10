//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var stepperLabel: UILabel!
    
    var tipValue = "10%"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        let isZeroPercent = sender == zeroPercentButton
        let isTenPercent = sender == tenPercentButton
        let isTwentyPercent = sender == twentyPercentButton
        
        DispatchQueue.main.async {
            self.zeroPercentButton.isSelected = isZeroPercent
            self.tenPercentButton.isSelected = isTenPercent
            self.twentyPercentButton.isSelected = isTwentyPercent
        }
        
        tipValue = sender.currentTitle!
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        DispatchQueue.main.async {
            self.stepperLabel.text = String(Int(sender.value))
        }
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        tipValue = tipValue.replacingOccurrences(of: "%", with: "")
        let tip = Double(tipValue)! / 100.0
        print(tip)
    }
    
    
}


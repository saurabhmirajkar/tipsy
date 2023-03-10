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
    
    var tipPercentage: String = "10%"
    var stepperValue: Int = 2
    
    var calculatorBrain = CalculatorBrain()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        let isZeroPercent = sender == zeroPercentButton
        let isTenPercent = sender == tenPercentButton
        let isTwentyPercent = sender == twentyPercentButton
        
        DispatchQueue.main.async {
            self.zeroPercentButton.isSelected = isZeroPercent
            self.tenPercentButton.isSelected = isTenPercent
            self.twentyPercentButton.isSelected = isTwentyPercent
        }
        
        tipPercentage = sender.currentTitle ?? "10%"
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        stepperValue = Int(sender.value)
        DispatchQueue.main.async {
            self.stepperLabel.text = String(self.stepperValue)
        }
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        calculatorBrain.calculateBill(tipPercentage: tipPercentage, billAmount: billTextField.text, splitCount: stepperValue)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.split = calculatorBrain.retrieveBill()
        }
    }
    
}


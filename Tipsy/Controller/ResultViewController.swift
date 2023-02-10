//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Saurabh Mirajkar on 10/02/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var split: Split?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let split {
            totalLabel.text = String(split.totalAmount)
            settingsLabel.text = "Split between \(split.numberOfPeople) people, with \( split.tipPercentage) tip"
        }
        
    }
    
    @IBAction func recalculatePress(_ sender: UIButton) {
        dismiss(animated: true)
    }

}

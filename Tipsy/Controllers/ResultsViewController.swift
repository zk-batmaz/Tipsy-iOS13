//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Zeynep Kübra Batmaz on 22.05.2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var totalBill: String?
    var numberOfPeople: Int?
    var tipPercentage: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = totalBill ?? "0.0"
        settingsLabel.text = "Split between \(numberOfPeople ?? 2) people, with \(tipPercentage ?? 10)% tip."
    }
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
  

}

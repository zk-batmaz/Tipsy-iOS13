//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    
    var splitNum = 2
    var selectedTip = "10%"
    var bill: Double = 123.56

    @IBAction func tipChanged(_ sender: UIButton) {
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        selectedTip = sender.currentTitle!

    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {

        splitNum = Int(sender.value)
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        let totalBill = Double(billTextField.text ?? "0.00") ?? 0.00
        
        if selectedTip == "10%" {
            bill = totalBill + (totalBill * 0.1)
            bill = bill / Double(splitNum)
        }
        else if selectedTip == "0%" {
            bill = totalBill / Double(splitNum)
        }
        else {
            bill = totalBill + (totalBill * 0.2)
            bill = bill / Double(splitNum)
        }
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalBill = String(format: "%.2f", bill)
            destinationVC.numberOfPeople = splitNum
            if selectedTip == "10%" {
                destinationVC.tipPercentage = 10
            }
            else if selectedTip == "0%" {
                destinationVC.tipPercentage = 0
            }
            else {
                destinationVC.tipPercentage = 20
            }
        }
    }
}


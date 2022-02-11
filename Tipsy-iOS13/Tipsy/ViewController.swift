//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billTotalLabel: UITextField!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var tenPercent: UIButton!
    @IBOutlet weak var zeroPercent: UIButton!
    @IBOutlet weak var twentyPercent: UIButton!
    
    var split = 2
    var tipPercentage = 0.0
    var billTotal = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func billTotalEntered(_ sender: UITextField) {
        let total = sender.text ?? "Enter your total"
        billTotal = Double(total) ?? 0.0
    }
    
    @IBAction func tipPercentageSelected(_ sender: UIButton) {
        let tip = sender.currentTitle
        billTotalLabel.endEditing(true)
        buttonReset()
        sender.isSelected = true
        switch tip {
        case "0%":
            tipPercentage = 0.0
        case "10%":
            tipPercentage = 0.1
        default:
            tipPercentage = 0.2
        }
        
    }
    @IBAction func splitUpOrDown(_ sender: UIStepper) {
        splitLabel.text = String(sender.value)
        split = Int(sender.value)
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToTotal", sender: self)
    }
    
    func buttonReset() {
        tenPercent.isSelected = false
        zeroPercent.isSelected = false
        twentyPercent.isSelected = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTotal"{
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.split = split
            destinationVC.tipPercentage = tipPercentage
            destinationVC.billTotal = billTotal
        }
    }
}

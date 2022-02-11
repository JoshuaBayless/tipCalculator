//
//  SecondViewController.swift
//  Tipsy
//
//  Created by Josh  Bayless on 2/10/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var totalWithTip: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    var split = 2
    var tipPercentage = 0.0
    var billTotal = 0.0
    var totalPerPerson = 0.0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        calculateTotalPerPerson()
        totalWithTip.text = String(format: "%.2f", totalPerPerson)
        detailLabel.text = "Split between \(split) people with a \(tipPercentage * 100)% tip."
    }
    
    func calculateTotalPerPerson() {
    totalPerPerson = (billTotal + (billTotal * tipPercentage)) / Double(split)
    }
    
    
    @IBAction func recalculate(_ sender: UIButton) {
         self.performSegue(withIdentifier: "backToCalculationScreen", sender: self)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

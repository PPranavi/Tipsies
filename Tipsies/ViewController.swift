//
//  ViewController.swift
//  Tipsies
//
//  Created by Pranavi Parsi on 7/8/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var amountBeforeTipTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var numPeopleLabel: UILabel!
    @IBOutlet weak var numPeopleSlider: UISlider!
    @IBOutlet weak var totalResultLabel: UILabel!
    @IBOutlet weak var splitResultLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TipSies"
        amountBeforeTipTextField.becomeFirstResponder()
    }
    
    var tipCalculator = TipCalculator(amountBeforeTip: 0, tipPercentage: 0.10)
    
    func calculateBill() {
        tipCalculator.tipPercentage = Double(tipPercentageSlider.value)/100.0
        tipCalculator.amountBeforeTip = Double(amountBeforeTipTextField.text!) ?? 0
        tipCalculator.calculateTip()
        updateUI()
    }
    
    func updateUI() {
        totalResultLabel.text = String(format: "$%0.2f", tipCalculator.totalAmount)
        let numPeople: Int = Int(numPeopleSlider.value)
        splitResultLabel.text = String(format: "$%0.2f", tipCalculator.totalAmount/Double(numPeople))
    }
    
    @IBAction func tipSliderValueChanged(sender: Any) {
        tipPercentageLabel.text = String(format: "Tip: %02d%%", Int(tipPercentageSlider.value))
        calculateBill()
    }
    
    @IBAction func numPeopleSliderValueChanged(sender: Any) {
        numPeopleLabel.text = "Split: \(Int(numPeopleSlider.value))"
        calculateBill()
    }
    
    
    @IBAction func amountBeforeTipTextFieldChanged(_ sender: Any) {
        calculateBill()
    }
}


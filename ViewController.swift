//
//  ViewController.swift
//  Prework
//
//  Created by Eva Sennrich on 1/14/22.
//

import UIKit
//import SwiftUI

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    var tipOne: Double = 0.15
    var tipTwo: Double = 0.18
    var tipThree: Double = 0.20
    var number = NumberFormatter()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        billAmountTextField.becomeFirstResponder()
        number.numberStyle = .currency
        number.usesGroupingSeparator = true
        number.locale = Locale(identifier: Locale.current.identifier)
        
        
        let defaults = UserDefaults.standard
        tipOne = Double(defaults.integer(forKey: "tip1")) / Double(100)
        tipTwo = Double(defaults.integer(forKey: "tip2")) / Double(100)
        tipThree = Double(defaults.integer(forKey: "tip3")) / Double(100)
        
        tipControl.setTitle(String(defaults.integer(forKey: "tip1")) + "%", forSegmentAt: 0)
        tipControl.setTitle(String(defaults.integer(forKey: "tip2")) + "%", forSegmentAt: 1)
        tipControl.setTitle(String(defaults.integer(forKey: "tip3")) + "%", forSegmentAt: 2)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateTip(_ sender: Any) {
        
        // Get bill amount from text field
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //Get total tip by multiplying tip * tipPercentage
        let tipPercentages = [tipOne, tipTwo, tipThree]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let regionalTip = currencyFormatter(val: String(tip))
        let total = bill + tip
        let regionalTotal = currencyFormatter(val: String(total))
        
        //Update tip amount label
        tipAmountLabel.text = regionalTip
        //update total amount
        totalLabel.text = regionalTotal
    }
    
    func currencyFormatter(val: String) -> String {
            if let num = Double(val) {
                let ns = NSNumber(value: num)
                return number.string(from: ns)!
            }
            return "Not a number."
        }
}
    
   
    
    
    
    
    




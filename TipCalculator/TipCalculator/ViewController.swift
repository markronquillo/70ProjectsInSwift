//
//  ViewController.swift
//  TipCalculator
//
//  Created by Mark Ronquillo on 11/10/2016.
//  Copyright © 2016 Mark Ronquillo. All rights reserved.
//

import UIKit

/**
 Write an app in MVC pattern -- DONE
 Work with Computed Properties
 Create a toolbar above the keyboard
 Set min and max values for Slider
 Convert Strings to Int / Double and vice versa -- DONE
 Handle calculations with formulas written in the Model 
 Enable or disable objects based on if the keyboard is open
 Get values from the UISlider and convert them to Int for use in the Model
 */
class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var slider : UISlider!
    @IBOutlet weak var amountText : UITextField!
    @IBOutlet weak var tipPercentLabel : UILabel!
    @IBOutlet weak var tipTotalLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var amount = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.addTarget(self, action: #selector(ViewController.sliderChange), for: .valueChanged)
        
        updateValues()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        amount = Double(textField.text!)!
        
        textField.text = "$\(String(format: "%.2f", amount))";
        textField.resignFirstResponder()
        
        updateValues()
        return true
    }
    
    
    func updateValues() {
        let tipPercent = Int(slider.value*100)
        let tipTotal = amount * Double(tipPercent) / 100
        tipPercentLabel.text = "Tip (\(tipPercent)%)"
        tipTotalLabel.text = String(format: "%.2f", tipTotal)
        totalLabel.text = String(format: "%.2f", tipTotal + amount)
    }
    
    func sliderChange() {
        updateValues()
    }
    
}


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
    
    var tip = Tip(amount: 0, tipPercentage: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.addTarget(self, action: #selector(ViewController.sliderChange), for: .valueChanged)
        
        let rect = CGRect(x: 0, y: 0, width: 320, height: 50)
        let doneToolbar: UIToolbar = UIToolbar(frame: rect)
        doneToolbar.barStyle = UIBarStyle.blackTranslucent
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(ViewController.closeKeyboard));
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        amountText.inputAccessoryView = doneToolbar
        
        updateValues()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        updateAmount(textField: textField)
        return true
    }
    
    func closeKeyboard() {
        updateAmount(textField: amountText)
        updateValues()
    }
    
    func updateAmount(textField : UITextField) {
        tip.amount = Double(textField.text!)!
        
        textField.text = "$\(String(format: "%.2f", tip.amount))";
        textField.resignFirstResponder()
    }
    
    func updateValues() {
        tipPercentLabel.text = "Tip (\(String(format: "%.2f", tip.tipPercentage * 100))%)"
        tipTotalLabel.text = String(format: "%.2f", tip.tipAmount)
        totalLabel.text = String(format: "%.2f", tip.totalAmount)
    }
    
    func sliderChange() {
        tip.tipPercentage = Double(slider.value)
        updateValues()
    }
    
}


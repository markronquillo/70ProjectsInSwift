//
//  ViewController.swift
//  SwipeToDismissKeyboard
//
//  Created by Mark Ronquillo on 13/10/2016.
//  Copyright © 2016 Mark Ronquillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView : UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        textView.becomeFirstResponder()
       
        let gest = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.closeKeyboard))
        gest.direction = .down
        textView.addGestureRecognizer(gest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func closeKeyboard() {
        textView.resignFirstResponder()
    }


}


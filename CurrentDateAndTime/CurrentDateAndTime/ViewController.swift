//
//  ViewController.swift
//  CurrentDateAndTime
//
//  Created by Mark Ronquillo on 13/10/2016.
//  Copyright © 2016 Mark Ronquillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//    Goals
//      Work with NSDate and NSDateFormatter
//      Set the current date and time based on the user's iPhone settings
//      Format the date to the user's UTC time
//      Refresh date and time
    
    @IBOutlet weak var dateLabel : UILabel!
    
    @IBAction func updateLabel() {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


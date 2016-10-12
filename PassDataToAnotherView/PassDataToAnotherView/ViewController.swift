//
//  ViewController.swift
//  PassDataToAnotherView
//
//  Created by Mark Ronquillo on 13/10/2016.
//  Copyright © 2016 Mark Ronquillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView : UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailSegue" {
            let vc = segue.destination as! DetailViewController
            vc.detail = textView.text
        }
    }

}


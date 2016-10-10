//
//  ViewController.swift
//  TapCounter
//
//  Created by Mark Ronquillo on 10/10/2016.
//  Copyright © 2016 Mark Ronquillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0 {
        didSet {
            countLabel.text = String(count)
        }
    }
    
    var timer : Timer!
    
    @IBOutlet weak var countLabel : UILabel!
    @IBOutlet weak var tapButton : UIButton!
    
    @IBAction func resetLabel() {
        count = 0
    }
    
    
    func increment() {
        count += 1
    }
    
    func incrementHold() {
        increment()
        timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(ViewController.increment), userInfo: nil, repeats: true)
    }
    
    func touchUp() {
       timer.invalidate()
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        tapButton.addTarget(self, action: #selector(ViewController.incrementHold), for: .touchDown)
        tapButton.addTarget(self, action: #selector(ViewController.touchUp), for: [.touchUpInside, .touchUpOutside])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}


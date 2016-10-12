//
//  ViewController.swift
//  Settings
//
//  Created by Mark Ronquillo on 10/10/2016.
//  Copyright © 2016 Mark Ronquillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//            http://stackoverflow.com/questions/26956728/changing-the-status-bar-color-for-specific-viewcontrollers-using-swift-in-ios8
    
    @IBOutlet weak var textArea : UITextView!
    
    var bgView : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.setViewMode), name: NSNotification.Name.UIApplicationWillEnterForeground, object: nil)
        
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 20)
        bgView = UIView(frame: frame)
        bgView.backgroundColor = UIColor.black
        self.view.addSubview(bgView)
        
        setViewMode()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    func setViewMode() {
        let nightMode = UserDefaults.standard.bool(forKey: "night_mode_preference")
        
        if nightMode {
            textArea.keyboardAppearance = UIKeyboardAppearance.dark
            textArea.backgroundColor = UIColor.black
            textArea.textColor = UIColor.white
            UIApplication.shared.statusBarStyle = .lightContent
            bgView.backgroundColor = UIColor.black
        } else {
            textArea.keyboardAppearance = UIKeyboardAppearance.default
            textArea.backgroundColor = UIColor.white
            textArea.textColor = UIColor.black
            UIApplication.shared.statusBarStyle = .default
            bgView.backgroundColor = UIColor.white
        }
    }


}


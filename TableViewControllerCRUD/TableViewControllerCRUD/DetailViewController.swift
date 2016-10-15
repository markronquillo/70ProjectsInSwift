//
//  DetailViewController.swift
//  TableViewControllerCRUD
//
//  Created by Mark Ronquillo on 15/10/2016.
//  Copyright © 2016 Mark Ronquillo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var delegate : AddDetailItemProtocol?
    
    @IBOutlet weak var textView : UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
        
        textView.becomeFirstResponder()
        textView.returnKeyType = .done
        
        let toolbar = UIToolbar()
        toolbar.bounds = CGRect(x: 0, y: 0, width: 320, height: 50)
        toolbar.sizeToFit()
        toolbar.barStyle = .default
        toolbar.items = [
            UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(DetailViewController.handleDone))
        ]
        
        self.textView.inputAccessoryView = toolbar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func handleDone() {
        // close the keyboard
        textView.resignFirstResponder()
        // add new item
        delegate?.addToItemList(item: textView.text)
        // close this viewcontroller
        self.navigationController?.popViewController(animated: true)
    }
}

extension DetailViewController : UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            handleDone()
            return false
        }
        
        return true
    }
}

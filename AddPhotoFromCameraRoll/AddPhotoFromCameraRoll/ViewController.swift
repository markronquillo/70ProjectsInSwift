//
//  ViewController.swift
//  AddPhotoFromCameraRoll
//
//  Created by Mark Ronquillo on 13/10/2016.
//  Copyright © 2016 Mark Ronquillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let imgPicker = UIImagePickerController()
    
    @IBOutlet weak var textView : UITextView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func selectImage() {
        imgPicker.allowsEditing = false
        imgPicker.sourceType = .photoLibrary
        
        self.present(imgPicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        imgPicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}


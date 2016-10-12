//
//  DetailViewController.swift
//  PassDataToAnotherView
//
//  Created by Mark Ronquillo on 13/10/2016.
//  Copyright © 2016 Mark Ronquillo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var detail : String!
    
    @IBOutlet weak var detailLabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailLabel.text = detail
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

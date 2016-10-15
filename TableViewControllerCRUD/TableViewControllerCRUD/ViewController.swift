//
//  ViewController.swift
//  TableViewControllerCRUD
//
//  Created by Mark Ronquillo on 14/10/2016.
//  Copyright © 2016 Mark Ronquillo. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var items = [
        "Milk",
        "Book",
        "Fan",
    ]
    
    @IBOutlet weak var editButton : UIBarButtonItem!
    
    
    /// First we define a toggle IBAction
    /// that sets the editing mode
    @IBAction func toggleEdit() {
        if isEditing {
            setEditing(false, animated: true)
            editButton.title = "Edit"
        } else {
            setEditing(true, animated: true)
            editButton.title = "Save"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let inset = UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
        self.tableView.contentInset = inset
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel!.text = items[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    func moveItem(from : Int, to : Int) {
        // row to move
        let row = items[from]
        
        // we delete this
        items.remove(at: from)
        
        // then insert it to its destination
        items.insert(row, at: to)
    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "AddDetailSegue" {
            let vc = segue.destination as! DetailViewController
            vc.delegate = self
        }
     }
}

extension TableViewController : AddDetailItemProtocol {
    func addToItemList(item: String) {
        items.append(item)
        self.tableView.reloadData()
    }
}



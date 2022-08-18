//
//  ContactTableViewController.swift
//  My_Contacts
//
//  Created by David Abel on 08/08/22.
//

import UIKit

class ContactTableViewController: UITableViewController {
    
    var contactList = ContactList()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
         self.navigationItem.leftBarButtonItem = self.editButtonItem
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
       // super.viewWillAppear(animated)
      
       // contactList.list.sort { $0.name < $1.name}
        tableView.reloadData()
        
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contactList.list.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contact", for: indexPath) as! ContactTableViewCell

        // Configure the cell...
        
        let contact = contactList.list[indexPath.row]
        cell.contactName?.text = contact.firstName + " " + contact.Surname
        cell.contactNumber?.text = contact.number
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            let title = NSLocalizedString("Are you sure you want to delete?", comment: "alertController title")
            let message = NSLocalizedString("Deleted contacts cannot be retrieved", comment: "alertController message")
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            let affirm = NSLocalizedString("Yes", comment: "alertyes")
            let decline = NSLocalizedString("No", comment: "alertno")

            let yes = UIAlertAction(title: affirm, style: .destructive)
            {(UIAlertAction) in
                self.contactList.deleteContact(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            let cancel = UIAlertAction(title: decline, style: .cancel, handler: nil)
            
            alert.addAction(yes)
            alert.addAction(cancel)
            present(alert, animated: true)
            
            
            
            
            
        } else if editingStyle == .insert {
        
        }    
    }
   

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        contactList.moveContact(from: fromIndexPath.row, to: to.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        switch segue.identifier{
        case "newContact":
            guard
                let dst = segue.destination as? DetailedContactViewController
            else {return}
            dst.contactList = contactList
            dst.isNew = true
            
        case "editContact":
            guard
                let dst = segue.destination as? DetailedContactViewController,
                let indexPath = tableView.indexPathForSelectedRow
            else {return}
            dst.contactList = contactList
            dst.isNew = false
            dst.indexPath = indexPath
            
        default:
            preconditionFailure("Segue identifier does not exist")
        }
    }
    

}

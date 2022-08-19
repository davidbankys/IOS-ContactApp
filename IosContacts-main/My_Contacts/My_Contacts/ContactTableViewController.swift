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
    

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
        
            context.deleteObject(myData.objectAtIndex(indexPath!.row) as NSManagedObject)
                       tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                   } else if editingStyle == .Insert {
                       // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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

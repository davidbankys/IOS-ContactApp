//
//  ContactList.swift
//  My_Contacts
//
//  Created by David Abel on 08/08/22.
//

import UIKit

class ContactList{
    var list = [Contact]()
    
    var ContactURL: URL{
        let documentDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentDirectories.first!
        return documentDirectory.appendingPathComponent("contact.archive")
    }
    
    //var contactList: ContactList
    init(){
//        for _ in 0...11{
//            list.append(Contact(random: true))
//        }
        do{
            let data = try Data(contentsOf: ContactURL)
            list = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! [Contact]
            print("data load")
        }catch let err{
            print(err)
        }
        
    }
    
    func moveContact(from fromIndex: Int, to toIndex: Int){
        let temp = list[fromIndex]
        list.remove(at: fromIndex)
        list.insert(temp, at: toIndex)
    }
    
    func addContact(name: String) -> Contact{
        let contact = Contact(name: name)
        list.append(contact)
        
        return contact
    }
    
    func addContact(name: String, lastName: String, number: String){
        list.append(Contact(name: name, lastName: lastName, number: number))
    }
    
    func updateContact(at: Int, name: String, lastName: String, number: String){
        self.list[at].firstName = name
        self.list[at].Surname = lastName
        self.list[at].number = number
//        contact.name = name
//        contact.lastName = lastName
//        contact.number = number
    }
    
    func deleteContact(at: Int){
     
        list.remove(at: at)
    }
    
    func save(){
        do{
            let data = try NSKeyedArchiver.archivedData(withRootObject: list, requiringSecureCoding: false)
            try data.write(to: ContactURL)
            print("saved")
        }catch let err{
            print(err)
        }
        }
        
}

//
//  Contact.swift
//  My_Contacts
//
//  Created by David Abel on 08/08/22.
//

import Foundation

class Contact: NSObject, NSCoding, NSSecureCoding {
    
    static var supportsSecureCoding: Bool = false
    
    func encode(with coder: NSCoder) {
        coder.encode(firstName, forKey: "firstName")
        coder.encode(Surname, forKey: "Surname")
        coder.encode(number, forKey: "number")
    }
    
    required init?(coder: NSCoder) {
        firstName = coder.decodeObject(forKey: "name") as! String
        Surname = coder.decodeObject(forKey: "lastName") as! String
        number = coder.decodeObject(forKey: "number") as! String
        
//        super.init()
    }

    
    var firstName: String = ""
    var Surname: String = ""
    var number: String = ""
    //var photo: String
    
    init(name: String){
        self.firstName=name
    }
    
    init(name: String, lastName: String, number: String){
        self.firstName=name
        self.Surname=lastName
        self.number=number
    }
    
}

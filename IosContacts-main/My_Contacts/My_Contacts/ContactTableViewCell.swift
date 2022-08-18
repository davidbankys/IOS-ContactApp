//
//  ContactTableViewCell.swift
//  My_Contacts
//
//  Created by David Abel on 08/08/22.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var contactNumber: UILabel!
    @IBOutlet weak var contactImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }

}

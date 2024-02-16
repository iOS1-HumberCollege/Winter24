//
//  contactTableViewCell.swift
//  Week5
//
//  Created by Rania Arbash on 2024-02-16.
//

import UIKit

class contactTableViewCell: UITableViewCell {

   
    @IBOutlet weak var contactImg: UIImageView!
    
    
    @IBOutlet weak var nameText: UILabel!
    
    
    @IBOutlet weak var numberText: UILabel!
    
    @IBOutlet weak var locationText: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

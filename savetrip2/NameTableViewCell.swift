//
//  NameTableViewCell.swift
//  savetrip2
//
//  Created by Rahul Chandrawanshi on 10/4/16.
//  Copyright © 2016 Rahul Chandrawanshi. All rights reserved.
//

import UIKit

class NameTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    @IBOutlet weak var Images: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var place: UILabel!
    
    @IBOutlet weak var tripName: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

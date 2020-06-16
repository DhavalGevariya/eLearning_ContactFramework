//
//  DhavalContactCell.swift
//  ContactFramework
//
//  Created by Dhaval Gevariya on 10/06/20.
//  Copyright © 2020 Dhaval Gevariya. All rights reserved.
//

import UIKit

class DhavalContactCell: UITableViewCell
{
    
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblContactnumber: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

//
//  ReportCell.swift
//  iHelp
//
//  Created by Tortora Roberto on 11/07/2017.
//  Copyright © 2017 The Round Table. All rights reserved.
//

import UIKit

class ReportCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    @IBOutlet weak var nameField: UILabel!
    @IBOutlet weak var dateField: UILabel!
    @IBOutlet weak var imageViewField: UIImageView!
}

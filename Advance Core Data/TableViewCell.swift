//
//  TableViewCell.swift
//  Advance Core Data
//
//  Created by Dhawal Mahajan on 16/12/18.
//  Copyright © 2018 Dhawal Mahajan. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var todolabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}



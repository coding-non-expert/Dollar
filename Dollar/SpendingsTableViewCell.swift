//
//  SpendingsTableViewCell.swift
//  Dollar
//
//  Created by RGS Student on 1/11/19.
//  Copyright © 2019 cuzwhynot. All rights reserved.
//

import UIKit

class SpendingsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var spendingField: UITextField!
    
    @IBOutlet weak var overallSpendingLabel: UILabel!
    @IBOutlet weak var overallSpendingsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

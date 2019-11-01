//
//  OverallSpendingTableViewCell.swift
//  Dollar
//
//  Created by Celeste Tan on 1/11/19.
//  Copyright © 2019 cuzwhynot. All rights reserved.
//

import UIKit

class OverallSpendingTableViewCell: UITableViewCell {

    
    @IBOutlet weak var overallLabel: UILabel!
    @IBOutlet weak var overallSpendingsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

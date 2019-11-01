//
//  FirstTableViewCell.swift
//  Dollar
//
//  Created by Adeena Ansari on 1/11/19.
//  Copyright © 2019 cuzwhynot. All rights reserved.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

    @IBOutlet weak var firstIconImage: UIImageView!
    @IBOutlet weak var firstCategoryLabel: UILabel!
    @IBOutlet weak var firstBudgetLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

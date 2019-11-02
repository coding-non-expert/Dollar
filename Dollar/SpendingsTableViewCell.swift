//
//  SpendingsTableViewCell.swift
//  Dollar
//
//  Created by RGS Student on 1/11/19.
//  Copyright © 2019 cuzwhynot. All rights reserved.
//

import UIKit
protocol SpendingCellDelegate {
    func textFieldClicked(id: String, money: Double)
}
class SpendingsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var spendingField: UITextField!
    var id: String!
    var delegate: SpendingCellDelegate!
    
    @IBAction func spendingTextField(_ sender: Any) {
        print("wow!")
        delegate.textFieldClicked(id: id, money: Double(spendingField.text ?? "") ?? 0.0)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

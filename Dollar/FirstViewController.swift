//
//  FirstViewController.swift
//  Dollar
//
//  Created by Celeste Tan on 19/10/19.
//  Copyright © 2019 cuzwhynot. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var homeNameLabel: UILabel!
    @IBOutlet weak var homeBalanceLabel: UILabel!
    @IBOutlet weak var popUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.applyRoundCorner(popUpButton)
        
    }

    func applyRoundCorner(_ object:AnyObject){
        object.layer.cornerRadius = object.frame.size.width / 2
        object.layer.masksToBounds = true
    }

    @IBAction func popUpButtonPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Want to know how your daily budget is calculated?", message: "Dollar divides the monthly budget by the number of days in the month to give you your daily budget.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
}


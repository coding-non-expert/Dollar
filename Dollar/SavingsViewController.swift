//
//  SavingsViewController.swift
//  Dollar
//
//  Created by Adeena Ansari on 1/11/19.
//  Copyright © 2019 cuzwhynot. All rights reserved.
//

import UIKit

class SavingsViewController: UIViewController {
    
    var savings = 0
    var spendings = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        savings = defaults.integer(forKey: "totalBudget")
        spendings = defaults.integer(forKey: "totalSpending")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if savings > spendings {
            performSegue(withIdentifier: "failedCheck", sender: nil)
        } else {
            performSegue(withIdentifier: "successCheck", sender: nil)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

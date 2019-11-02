//
//  SavingsViewController.swift
//  Dollar
//
//  Created by Adeena Ansari on 1/11/19.
//  Copyright © 2019 cuzwhynot. All rights reserved.
//

import UIKit

class SavingsViewController: UIViewController {
    
    var savings = 0.0
    var spendings = 0.0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        savings = defaults.double(forKey: "totalBudget")
        spendings = defaults.double(forKey: "totalSpending")
        if savings < spendings {
            performSegue(withIdentifier: "failedCheck", sender: nil)
        } else {
            performSegue(withIdentifier: "successCheck", sender: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
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

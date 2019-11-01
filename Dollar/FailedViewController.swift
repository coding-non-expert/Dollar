//
//  FailedViewController.swift
//  Dollar
//
//  Created by Adeena Ansari on 1/11/19.
//  Copyright © 2019 cuzwhynot. All rights reserved.
//

import UIKit

class FailedViewController: UIViewController {

    @IBOutlet var tapGestureRecognizer: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapped(_ sender: Any) {
        performSegue(withIdentifier: "failedClicked", sender: nil)
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

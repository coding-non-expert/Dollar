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
    @IBOutlet weak var popUpButton: UIButton!
  
    var budget = Budget.loadSampleData()
    

    /*
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Might want to check userDefaults here to see if a name has been set
        // If it has... no need to run the code below!
        
        let alert = UIAlertController(title: "Hi! I'm DOLLAR! What's your name?", message: "", preferredStyle: .alert)
        
        // Cancel action has a nil handler—does nothing, just cancels
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        // OK action asks for the text from the alert's first text field
        let okAction = UIAlertAction(title: "Save", style: .default) { (action) in
            if let textField = alert.textFields?.first,
                let text = textField.text {
                print(text)
                self.homeNameLabel.text = "\(text)"
                // Your job is to save here
            }
        }
        alert.addAction(okAction)
        
        // Another closure! This one lets you configure the textField.
        alert.addTextField { (textField) in
            textField.placeholder = "Please enter your name"
        }
        
        present(alert, animated: true)
    }
*/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let loadedBudget = Budget.loadFromFile(){
            budget = loadedBudget
        }else{
            budget = Budget.loadSampleData()
        }
        
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


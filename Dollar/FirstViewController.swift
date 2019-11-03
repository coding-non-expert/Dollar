//
//  FirstViewController.swift
//  Dollar
//
//  Created by Celeste Tan on 19/10/19.
//  Copyright © 2019 cuzwhynot. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var popUpButton: UIButton!
  
    var names: Name!
    var needName = true
    var budgetArray: [Budget] = Budget.loadFromFile() ?? Budget.loadSampleData()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
        
        // Might want to check userDefaults here to see if a name has been set
        // If it has... no need to run the code below!
        
        //let defaults = UserDefaults.standard
        /*
        if let uname = defaults.string(forKey: "name") {
           // self.homeNameLabel.text = alertText
            return
        
        let alert = UIAlertController(title: "Hi! I'm DOLLAR! What's your name?", message: "", preferredStyle: .alert)
        
        // Cancel action has a nil handler—does nothing, just cancels
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        // OK action asks for the text from the alert's first text field
        let okAction = UIAlertAction(title: "Save", style: .default) { (action) in
            if let textField = alert.textFields?.first,
                let alertText = textField.text {
                print(alertText)
                self.homeNameLabel.text = alertText
                let defaults = UserDefaults.standard
                defaults.set(uname, forKey: "name")
            }
        }
        alert.addAction(okAction)
        
        // Another closure! This one lets you configure the textField.
        alert.addTextField { (textField) in
            textField.placeholder = "Please enter your name"
        }
        
        present(alert, animated: true)
        
        }
    }*/

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        nameTextField.delegate = self
        self.applyRoundCorner(popUpButton)
        
        if names != nil{
            needName = false
            nameTextField.text = names.name
        }
    
    }
        
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        if let loadedBudget = Budget.loadFromFile(){
            budgetArray = loadedBudget
        }else{
            budgetArray = Budget.loadSampleData()
        }
        tableView.reloadData()
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return budgetArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let loadedDailyBudget = Budget.loadFromFile() {
            budgetArray = loadedDailyBudget
        } else {
            budgetArray = Budget.loadSampleData()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "dailyBudgetCell", for: indexPath)
        if let cell = cell as? FirstTableViewCell {
            let currentDailyBudget = budgetArray[indexPath.row]
            cell.firstCategoryLabel?.text = currentDailyBudget.category
            cell.firstIconImage?.image = UIImage(named: currentDailyBudget.imageFileName)
            let numberFormatter = NumberFormatter()
            numberFormatter.minimumIntegerDigits = 1
            numberFormatter.minimumFractionDigits = 2
            numberFormatter.maximumIntegerDigits = 2
            var numberBeforeFormat = (Double(round(100*(currentDailyBudget.budget / 30.0))/100))
            cell.firstBudgetLabel?.text = "$\(numberFormatter.string(from: NSNumber(value: numberBeforeFormat))!)"
//            "\(Double(round(100*(currentDailyBudget.budget / 30.0))/100))"
            }

        return cell

    }

    func applyRoundCorner(_ object:AnyObject){
        object.layer.cornerRadius = object.frame.size.width / 2
        object.layer.masksToBounds = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        return false
    }

        
    @IBAction func nameTextFieldFilled(_ sender: Any) {
        
    }
    
    @IBAction func popUpButtonPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Want to know how your daily budget is calculated?", message: "Dollar divides the monthly budget by the number of days in the month to give you your daily budget.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}



//
//  AddorEditTableViewController.swift
//  Dollar
//
//  Created by Adeena Ansari on 31/10/19.
//  Copyright © 2019 cuzwhynot. All rights reserved.
//

import UIKit

class AddorEditTableViewController: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    
    
    @IBOutlet weak var categoryTextfield: UITextField!
    @IBOutlet weak var iconTextField: UITextField!
    @IBOutlet weak var budgetTextField: UITextField!
    
    var budget: Budget!
    var needBudget = true
    var icons = ["baby.png","clothes.png","devices.png", "education.png", "entertainment.png","food.png", "gift.png", "groceries.png", "health.png", "holiday.png", "membership.png", "pet.png", "renovation.png", "self.png", "shopping.png", "sports.png", "transport.png"]
    var picker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        categoryTextfield.delegate = self
        budgetTextField.delegate = self
        iconTextField.inputView = picker
        
        if budget != nil{
            needBudget = false
            categoryTextfield.text = budget.category
            iconTextField.text = budget.imageFileName
            budgetTextField.text = "\(budget.budget)"
            
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return icons.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        iconTextField.text = icons[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return icons[row]
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        categoryTextfield.resignFirstResponder()
        budgetTextField.resignFirstResponder()
        return false
    }
    


    
    

    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addBudget"{
            let category = categoryTextfield.text ?? ""
            let imageFileName = iconTextField.text ?? ""
            let budgetName = Double(budgetTextField.text ?? "") ?? 0
            let spendingName = 0.0
            
            
            if needBudget == true {
                budget = Budget(category: category, imageFileName: imageFileName, budget: budgetName, spending: Double(spendingName))
            } else {
                budget.category = category
                budget.imageFileName = imageFileName
                budget.budget = budgetName
            }
        }
            /*let destVC = segue.destination as? BudgetTableViewController,
            let indexPath = tableView.indexPathForSelectedRow {
            
            
            destVC.budget = monthlyBudget(category: <#T##String#>, imageFileName: <#T##String#>, budget: <#T##Int#>)
        }*/
        

        
    }
    
}

 


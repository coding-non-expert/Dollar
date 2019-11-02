//
//  BudgetTableViewController.swift
//  Dollar
//
//  Created by Adeena Ansari on 26/10/19.
//  Copyright © 2019 cuzwhynot. All rights reserved.
//

import UIKit

class BudgetTableViewController: UITableViewController {

    @IBOutlet weak var plusButton: UIBarButtonItem!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    var budget = Budget.loadSampleData()
    
    var overallMoney = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        if let loadedBudget = Budget.loadFromFile(){
            budget = loadedBudget
        } else{
            budget = Budget.loadSampleData()
        }
    }

    // MARK: - Table view data source

    
    @IBAction func barButtonPressed(_ sender: Any) {
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (budget.count+1)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "budgetCell", for: indexPath)
        if let cell = cell as? BudgetTableViewCell {
            if indexPath.row < budget.count {
                let monthlyBudget = budget[indexPath.row]
                cell.categoryLabel?.text = monthlyBudget.category
                cell.iconImage?.image = UIImage(named: monthlyBudget.imageFileName)
                let numberFormatter = NumberFormatter()
                numberFormatter.minimumFractionDigits = 2
                var numberBeforeFormat = (Double(round(100*monthlyBudget.budget)/100))
                cell.budgetLabel?.text = numberFormatter.string(from: NSNumber(value: numberBeforeFormat))

//                cell.budgetLabel?.text = "\(monthlyBudget.budget)"
            } else {
                cell.categoryLabel.text = "Overall"
                overallMoney = 0.0
                for element in budget {
                    overallMoney += element.budget
                }
                cell.iconImage?.image = nil
                let numberFormatter = NumberFormatter()
                numberFormatter.minimumFractionDigits = 2
                var numberBeforeFormat = (Double(round(100*overallMoney)/100))
                cell.budgetLabel?.text = numberFormatter.string(from: NSNumber(value: numberBeforeFormat))
                let defaults = UserDefaults.standard
                defaults.set(overallMoney, forKey: "totalBudget")
            }
        }
//
//        let otherCell = tableView.dequeueReusableCell(withIdentifier: "overallBudget", for: indexPath)
//        if let otherCell = cell as? BudgetTableViewCell {
//            otherCell.overallBudgetLabel.text = "ahh"

        
        // Configure the cell...
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

   
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if indexPath.row < budget.count {
                budget.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                Budget.saveToFile(budgets: budget)
                tableView.reloadData()
            }
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "budgetCell", for: fromIndexPath)
        if let cell = cell as? BudgetTableViewCell {
            if fromIndexPath.row < budget.count {
                let monthlyBudget = budget.remove(at: fromIndexPath.row)
                budget.insert(monthlyBudget, at: to.row)
                tableView.reloadData()
            } else {
                tableView.reloadData()
            }
        }
    }
    
    // saving new data added
    @IBAction func unwindToBudgetTable(segue: UIStoryboardSegue){
        if segue.identifier == "addBudget", let source = segue.source as? AddorEditTableViewController {
            budget.append(source.budget)
            Budget.saveToFile(budgets: budget)
            tableView.reloadData()
        }
    }

    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

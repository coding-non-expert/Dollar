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
    
    var budget = [
        Budget(category: "Transport", imageFileName: "car", budget: 0),
        Budget(category: "Food", imageFileName: "food", budget: 0),
        Budget(category: "Savings", imageFileName: "savings", budget: 0),
        Budget(category: "Bills", imageFileName: "bills", budget: 0),
        Budget(category: "Holiday", imageFileName: "travel", budget: 0)
    ]
    var overallMoney = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let loadedBudget = Budget.loadFromFile(){
            budget = loadedBudget
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        //self.navigationItem.rightBarButtonItem = self.editButtonItem
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
                cell.budgetLabel?.text = "\(monthlyBudget.budget)"
            } else {
                cell.categoryLabel.text = "Overall"
                overallMoney = 0
                for element in budget {
                    overallMoney += element.budget
                }
                cell.budgetLabel.text = "\(overallMoney)"
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
            }
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let monthlyBudget = budget.remove(at: fromIndexPath.row)
        budget.insert(monthlyBudget, at: to.row)
        tableView.reloadData()

    }
    
    
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

//
//  SpendingsTableViewController.swift
//  Dollar
//
//  Created by Adeena Ansari on 31/10/19.
//  Copyright © 2019 cuzwhynot. All rights reserved.
//

import UIKit

class SpendingsTableViewController: UITableViewController {
    
    var spending: [Budget] = Budget.loadFromFile() ?? Budget.loadSampleData()
    var sspending: [Spending]
    
    var overallSpending = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        spending = Budget.loadFromFile() ?? Budget.loadSampleData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (spending.count+1)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        Budget.loadFromFile()
        let cell = tableView.dequeueReusableCell(withIdentifier: "spendingsCell", for: indexPath)
        if let cell = cell as? SpendingsTableViewCell {
            if indexPath.row < spending.count {
                let spendings = spending[indexPath.row]
                cell.categoryLabel?.text = spendings.category
                cell.iconImage?.image = UIImage(named: spendings.imageFileName)
                cell.spendingField?.text = ""
            }else{
                cell.categoryLabel.text = "Overall"
                overallSpending = 0
                for element in spending {
                    overallSpending += element.spending
                }
                cell.iconImage?.image = nil
                cell.spendingField.text = "\(overallSpending)"
            }
        }

        return cell
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
            spending.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            Budget.saveToFile(budgets: spending)
            tableView.reloadData()
        } else if editingStyle == .insert {
            sspending.append(source.spending)
            Spending.saveToFile(spendings: sspending)
            tableView.reloadData()
        }
    }
    

    
    // Override to support rearranging the table view.
    /*override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let spendings = spending.remove(at: fromIndexPath.row)
        spending.insert(spendings, at: to.row)
        tableView.reloadData()
        
    }*/
    

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

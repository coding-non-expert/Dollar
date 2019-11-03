//
//  SpendingsTableViewController.swift
//  Dollar
//
//  Created by Adeena Ansari on 31/10/19.
//  Copyright © 2019 cuzwhynot. All rights reserved.
//

import UIKit

class SpendingsTableViewController: UITableViewController, SpendingCellDelegate {
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    func textFieldClicked(id: String, money: Double) {
        var overallSpending = 0.0
        for (index, currentRow) in spendingArray.enumerated() {
            if currentRow.id == id {
                spendingArray[index].spending = money
                print("\(currentRow.category): \(spendingArray[index].spending)" )
            }
        }
        Budget.saveToFile(budgets: spendingArray)
        tableView.reloadData()
    }
    
    
    var spendingArray: [Budget] = Budget.loadFromFile() ?? Budget.loadSampleData()
//    var sspending: [Spending] = []
    
    var overallSpending = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        if let loadedSpending = Budget.loadFromFile() {
            spendingArray = loadedSpending
        } else {
            spendingArray = Budget.loadSampleData()
        }
        tableView.reloadData()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return spendingArray.count + 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let loadedSpending = Budget.loadFromFile() {
            spendingArray = loadedSpending
        } else {
            spendingArray = Budget.loadSampleData()
        }
        if indexPath.row < spendingArray.count {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "spendingsCell", for: indexPath)
            if let cell1 = cell1 as? SpendingsTableViewCell {
                let currentSpending = spendingArray[indexPath.row]
                cell1.categoryLabel?.text = currentSpending.category
                cell1.iconImage?.image = UIImage(named: currentSpending.imageFileName)
                cell1.spendingField?.text = "\(currentSpending.spending)"
                cell1.delegate = self
                cell1.id = currentSpending.id
            }
            return cell1
        } else {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "overallSpendingCell", for: indexPath)
            if let cell2 = cell2 as? OverallSpendingTableViewCell {
//                cell2.overallSpendingLabel.text = "Overall"
                overallSpending = 0.0
                for element in spendingArray {
                    overallSpending += element.spending
                }
                let numberFormatter = NumberFormatter()
                numberFormatter.minimumIntegerDigits = 1
                numberFormatter.minimumFractionDigits = 2
                numberFormatter.maximumFractionDigits = 2
                var numberBeforeFormat = (Double(round(100*overallSpending)/100))
                cell2.overallSpendingsLabel.text = "$\(numberFormatter.string(from: NSNumber(value: numberBeforeFormat))!)"
                let defaults = UserDefaults.standard
                defaults.set(overallSpending, forKey: "totalSpending")
            }
            return cell2
        }
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        tableView.reloadData()
    }
    
    
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
    */

    
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

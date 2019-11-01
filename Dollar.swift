//
//  Dollar.swift
//  Dollar
//
//  Created by RGS Student on 31/10/19.
//  Copyright © 2019 cuzwhynot. All rights reserved.
//

import Foundation

class Budget: Codable {
    var category: String
    var imageFileName: String
    var budget: Int
    var spending: Int
    
    init (category: String, imageFileName: String, budget: Int, spending: Int){
        self.category = category
        self.imageFileName = imageFileName
        self.budget = budget
        self.spending = spending
    }

    static func loadSampleData() -> [Budget]{
        return[
            Budget(category: "Transport", imageFileName: "car", budget: 0, spending: 0),
            Budget(category: "Food", imageFileName: "food", budget: 0, spending: 0),
            Budget(category: "Savings", imageFileName: "savings", budget: 0, spending: 0),
            Budget(category: "Bills", imageFileName: "bills", budget: 0, spending: 0),
            Budget(category: "Holiday", imageFileName: "travel", budget: 0, spending: 0)
        ]
    }
    
    static func getArchiveURL() -> URL {
        let plistName = "budgets"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent(plistName).appendingPathExtension("plist")
    }

    static func saveToFile(budgets: [Budget]) {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedBudget = try? propertyListEncoder.encode(budgets)
        try? encodedBudget?.write(to: archiveURL, options: .noFileProtection)
    }

    static func loadFromFile() -> [Budget]? {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        guard let retrievedBudgetData = try? Data(contentsOf: archiveURL) else { return nil }
        guard let decodedBudget = try? propertyListDecoder.decode(Array<Budget>.self, from: retrievedBudgetData) else { return nil }
        return decodedBudget
    }

}

class Spending: Codable {
    var category: String
    var imageFileName: String
    var spending: Int
    
    init (category: String, imageFileName: String, spending: Int){
        self.category = category
        self.imageFileName = imageFileName
        self.spending = spending
    }
    
    static func getArchiveURL() -> URL {
        let plistName = "spendings"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent(plistName).appendingPathExtension("plist")
    }
    
    static func saveToFile(spendings: [Spending]) {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedSpending = try? propertyListEncoder.encode(spendings)
        try? encodedSpending?.write(to: archiveURL, options: .noFileProtection)
    }
    
    static func loadFromFile() -> [Spending]? {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        guard let retrievedSpendingData = try? Data(contentsOf: archiveURL) else { return nil }
        guard let decodedSpending = try? propertyListDecoder.decode(Array<Spending>.self, from: retrievedSpendingData) else { return nil }
        return decodedSpending
    }
    
}

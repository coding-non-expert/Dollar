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
    var budget: Double
    var spending: Double
    var id: String
    
    init (category: String, imageFileName: String, budget: Double, spending: Double){
        self.category = category
        self.imageFileName = imageFileName
        self.budget = budget
        self.spending = spending
        self.id = UUID().uuidString
    }

    static func loadSampleData() -> [Budget]{
        return[
            Budget(category: "Transport", imageFileName: "transport", budget: 0.0, spending: 0.0),
            Budget(category: "Food", imageFileName: "food", budget: 0.0, spending: 0.0),
            Budget(category: "Savings", imageFileName: "savings", budget: 0.0, spending: 0.0),
            Budget(category: "Education", imageFileName: "education", budget: 0.0, spending: 0.0),
            Budget(category: "Holiday", imageFileName: "holiday", budget: 0.0, spending: 0.0)
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

class Name: Codable {
    var name: String
    var id: String
    
    init (name: String){
        self.name = name
        self.id = UUID().uuidString
    }

    static func getArchiveURL() -> URL {
        let plistName = "names"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent(plistName).appendingPathExtension("plist")
    }
    
    static func saveToFile(names: [Name]) {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedName = try? propertyListEncoder.encode(names)
        try? encodedName?.write(to: archiveURL, options: .noFileProtection)
    }
    
    static func loadFromFile() -> [Name]? {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        guard let retrievedNameData = try? Data(contentsOf: archiveURL) else { return nil }
        guard let decodedName = try? propertyListDecoder.decode(Array<Name>.self, from: retrievedNameData) else { return nil }
        return decodedName
    }
    
}

//
//class Spending: Codable {
//    var category: String
//    var imageFileName: String
//    var spending: Int
//
//    init (category: String, imageFileName: String, spending: Int){
//        self.category = category
//        self.imageFileName = imageFileName
//        self.spending = spending
//    }
//
//    static func getArchiveURL() -> URL {
//        let plistName = "spendings"
//        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//        return documentsDirectory.appendingPathComponent(plistName).appendingPathExtension("plist")
//    }
//
//    static func saveToFile(spendings: [Spending]) {
//        let archiveURL = getArchiveURL()
//        let propertyListEncoder = PropertyListEncoder()
//        let encodedSpending = try? propertyListEncoder.encode(spendings)
//        try? encodedSpending?.write(to: archiveURL, options: .noFileProtection)
//    }
//
//    static func loadFromFile() -> [Spending]? {
//        let archiveURL = getArchiveURL()
//        let propertyListDecoder = PropertyListDecoder()
//        guard let retrievedSpendingData = try? Data(contentsOf: archiveURL) else { return nil }
//        guard let decodedSpending = try? propertyListDecoder.decode(Array<Spending>.self, from: retrievedSpendingData) else { return nil }
//        return decodedSpending
//    }
//
//}

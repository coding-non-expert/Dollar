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
    
    init (category: String, imageFileName: String, budget: Int){
        self.category = category
        self.imageFileName = imageFileName
        self.budget = budget
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

//
//  DataManager.swift
//  Starling Savings
//
//  Created by Edward on 08/02/2020.
//  Copyright © 2020 Edward Theodor Danescu. All rights reserved.
//

import Foundation
import UIKit

struct DataManager {
    
/// Return the value of a figure label in minor units.
    func minorUnitsFromLabel(_ label : UILabel) -> Int? {
        
        guard let text = label.text else {
            return nil
        }
        
        let filteredText = text.filter {"0123456789".contains($0)} // Remove non-numerical characters
        
        guard let amount = Int(filteredText) else {
            return nil
        }
        return amount
    }
    
    
/// Filter transactions by only considering:
///     - Transactions made after the last transfer to the savings goal.
///     - Outbound transactions.
/// Compute roundups on these transactions.
    func newRoundups(forTransactions transactions : [Transaction]) -> Int {
        
        var minorUnitAmounts = [Int]()
        
        for transaction in transactions {
            
            // Checking on the counter party name only for convenience.
            if transaction.counterPartyName == "Savings" {break} // Only consider transactions up to the last roundups transfer
            if transaction.direction == .inBound {continue}      // Only consider outbound transactions
            
            minorUnitAmounts.append(transaction.minorUnits)
        }
        return aggregateRoundups(forMinorUnits: minorUnitAmounts)
    }
    
    
// MARK: Helper methods
    
/// Compute the aggregate roundups for a given list of transaction amounts.
    private func aggregateRoundups(forMinorUnits amounts: [Int]) -> Int {
        
        var totalRoundups = 0
        
        for amount in amounts {
            let reminderMinorUnits = amount % 100
            if reminderMinorUnits != 0 { // Consider non-whole amounts only
                let differenceToNextMajorUnit = 100 - reminderMinorUnits
                totalRoundups += differenceToNextMajorUnit
            }
        }
        return totalRoundups
    }

}

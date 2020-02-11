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
    

    func minorUnitsFromLabel(_ label : UILabel) -> Int? {
        
        guard let text = label.text else {
            return nil
        }
        
        let filteredText = text.filter {"0123456789".contains($0)}
        
        guard let amount = Int(filteredText) else {
            return nil
        }
        return amount
    }
    
    
    func newRoundupsFor(allTransactions transactions : [Transaction]) -> Int {
        
        var minorUnitAmounts = [Int]()
        
        for transaction in transactions {
            
            if transaction.counterPartyName == "Savings" {break} //Only consider transactions up to the last roundups transfer
            if transaction.direction == .inBound {continue} //Only consider outbound transactions
            
            minorUnitAmounts.append(transaction.minorUnits)
        }
        return aggregateRoundups(forMinorUnits: minorUnitAmounts)
    }
    
    
    private func aggregateRoundups(forMinorUnits amounts: [Int]) -> Int {
        
        var totalRoundups = 0
        print(amounts)
        for amount in amounts {
            let reminderMinorUnits = amount % 100
            if reminderMinorUnits != 0 {
                let differenceToNextMajorUnit = 100 - reminderMinorUnits
                totalRoundups += differenceToNextMajorUnit
            }
        }
        return totalRoundups
    }

}

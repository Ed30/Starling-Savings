//
//  APIParameters.swift
//  Starling Savings
//
//  Created by Edward on 10/02/2020.
//  Copyright © 2020 Edward Theodor Danescu. All rights reserved.
//

import Foundation
import Alamofire

struct APIParameters {
    
    static func transactionsRequest(fromDate startDate: Date, toDate endDate: Date = Date.today()) -> Parameters {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        
        let startDateString = dateFormatter.string(from: startDate).components(separatedBy: " ")[0]
        let startTimeString = "00:00:00.000"
        
        let endDateString = dateFormatter.string(from: endDate).components(separatedBy: " ")[0]
        let endTimeString = dateFormatter.string(from: endDate).components(separatedBy: " ")[1]
        
        let parameters : Parameters = [
            "minTransactionTimestamp" : "\(startDateString)T\(startTimeString)Z",
            "maxTransactionTimestamp" : "\(endDateString)T\(endTimeString)Z"
        ]
        return parameters
    }
    
    
    static func addFundsToGoalRequest(minorUnits : Int) -> [String : Any] {
        
        let amount = ["currency" : "GBP", "minorUnits" : minorUnits] as [String : Any]
        
        let parameters = ["amount" : amount]
        
        print(parameters)

        return parameters
    }
    
}



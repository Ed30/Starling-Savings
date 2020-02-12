//
//  APIParameters.swift
//  Starling Savings
//
//  Created by Edward on 10/02/2020.
//  Copyright © 2020 Edward Theodor Danescu. All rights reserved.
//

import Foundation
import Alamofire

/**
API Parameters Struct containing static functions.
These functions generate and return HTTP request parameters to be used in API calls.
*/
struct APIParameters {
    
/// Return HTTP request parameters for an API call getting transactions between two timestamps.
    static func transactionsRequest(fromDate startDate: Date, toDate endDate: Date = Date.today()) -> Parameters {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        
        let startDateString = dateFormatter.string(from: startDate).components(separatedBy: " ")[0] //Date component
        let startTimeString = "00:00:00.000"
        
        let endDateString = dateFormatter.string(from: endDate).components(separatedBy: " ")[0]     //Date component
        let endTimeString = dateFormatter.string(from: endDate).components(separatedBy: " ")[1]     //Time component
        
        let parameters : Parameters = [
            "minTransactionTimestamp" : "\(startDateString)T\(startTimeString)Z",
            "maxTransactionTimestamp" : "\(endDateString)T\(endTimeString)Z"
        ]
        return parameters
    }
    
    
/// Return HTTP request parameters for an API call getting transactions between two timestamps.
    static func addFundsToGoalRequest(minorUnits : Int) -> [String : Any] {
        
        let amount = ["currency" : "GBP", "minorUnits" : minorUnits] as [String : Any]
        let parameters = ["amount" : amount]
        return parameters
    }
    
}



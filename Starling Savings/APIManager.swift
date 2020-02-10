//
//  NetworkManager.swift
//  Starling Savings
//
//  Created by Edward on 06/02/2020.
//  Copyright © 2020 Edward Theodor Danescu. All rights reserved.
//

import Foundation
import Alamofire

struct APIManager {
    
    let session = Alamofire.Session()
    let baseURL = "https://api-sandbox.starlingbank.com"
    let headers : HTTPHeaders = [
    "Accept" : "application/json",
    "Content-Type": "application/json",
    "Authorization" : "Bearer \(DataManager().userAccessToken)"]
    
    
    func getClientName(handler: @escaping (String) -> Void) {
        
        let clientNameURL = "/api/v2/account-holder/name"
        
        APIGetRequest(requestURL: clientNameURL) { result in
            
            //Extract received data from JSON
            do {
                if let contents = try JSONSerialization.jsonObject(with: result, options: []) as? [String : Any] {
                    if let accountHolderName = contents["accountHolderName"] as? String {
                        handler(accountHolderName)
                    }
                }
            } catch let error {
                print(error.localizedDescription)
                self.displayWarning()
            }
            
        }
        
        
    }
    
    
    func getFirstAccountAndDefaultCategory(handler: @escaping (String, String) -> Void) {
        
        let accountsURL = "/api/v2/accounts"
        
        APIGetRequest(requestURL: accountsURL) { result in
            
            //Extract received data from JSON
            do {
                if let contents = try JSONSerialization.jsonObject(with: result, options: []) as? [String : Any] {
                    if let accounts = contents["accounts"] as? [Any] {
                        if let firstAccount = accounts[0] as? [String : Any] {
                            if let accountUid = firstAccount["accountUid"] as? String {
                                if let categoryUid = firstAccount["defaultCategory"] as? String {
                                    print("ACCOUNT ID IS", accountUid)
                                    print("CATEGORY ID IS", categoryUid)
                                    handler(accountUid, categoryUid)
                                }
                            }
                        }
                    }
                }
            } catch let error {
                print(error.localizedDescription)
                self.displayWarning()
            }
        }
        
    }
    
    
    func getBalance(forAccountId id: String, handler: @escaping (Double) -> Void) {
        
        let balanceURL = "/api/v2/accounts/\(id)/balance"
        
        APIGetRequest(requestURL: balanceURL) { result in
            
            //Extract received data from JSON
            do {
                if let contents = try JSONSerialization.jsonObject(with: result, options: []) as? [String : Any] {
                    if let effectiveBalance = contents["effectiveBalance"] as? [String : Any] {
                        if let minorUnits = effectiveBalance["minorUnits"] as? Int {
                            let balance = Double(minorUnits)/100.0
                            print("BALANCE IS", balance)
                            handler(balance)
                        }
                    }
                }
            } catch let error {
                print(error.localizedDescription)
                self.displayWarning()
            }
            
        }
        
        
    }
    
    
    
    
    func getWeekOutboundTransactionAmounts(forAccountId accountId : String, categoryId : String, handler: @escaping ([Int]) -> Void) {
        
        let lastMonday = Date.today().previous(.monday, considerToday: true)
        let transactionsURL = "/api/v2/feed/account/\(accountId)/category/\(categoryId)/\(transactionsRequestURL(fromDate: lastMonday))"
        var transactionAmounts = [Int]()
        
        APIGetRequest(requestURL: transactionsURL) { result in
            
            //Extract received data from JSON
            do {
                if let contents = try JSONSerialization.jsonObject(with: result, options: []) as? [String : Any] {
                    if let feedItems = contents["feedItems"] as? [[String : Any]] {
                        for transaction in feedItems {
                            if let direction = transaction["direction"] as? String {
                                if direction == "OUT" {
                                    if let amount = transaction["amount"] as? [String : Any] {
                                        if let minorUnits = amount["minorUnits"] as? Int {
                                            transactionAmounts.append(minorUnits)
                                        }
                                    }
                                }
                            }
                        }
                        handler(transactionAmounts)
                    }
                }
            } catch let error {
                print(error.localizedDescription)
                self.displayWarning()
            }
        }
    }
    
    
    func getSavingsGoalAmount(forAccountId accountId : String, goalId : String, handler: @escaping (Double) -> Void) {
        
        let goalsURL = "/api/v2/account/\(accountId)/savings-goals/\(goalId)"
        
        APIGetRequest(requestURL: goalsURL) { result in
            
            //Extract received data from JSON
            do {
                if let contents = try JSONSerialization.jsonObject(with: result, options: []) as? [String : Any] {
                    if let totalSaved = contents["totalSaved"] as? [String : Any] {
                        if let minorUnits = totalSaved["minorUnits"] as? Int {
                            let saved = Double(minorUnits)/100.0
                            print("TOTAL SAVED ", saved)
                            handler(saved)
                        }
                    }
                }
            } catch let error {
                print(error.localizedDescription)
                self.displayWarning()
            }
        }
    }
    
    
    private func transactionsRequestURL(fromDate startDate: Date, toDate endDate: Date = Date.today()) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let startDateString = dateFormatter.string(from: startDate).components(separatedBy: " ")[0]
        let startTimeString = "00:00:00"
        
        let endDateString = dateFormatter.string(from: endDate).components(separatedBy: " ")[0]
        let endTimeString = dateFormatter.string(from: endDate).components(separatedBy: " ")[1]
        
        let firstTimeStamp = "minTransactionTimestamp=\(startDateString)T\(startTimeString).000Z"
        let secondTimeStamp = "maxTransactionTimestamp=\(endDateString)T\(endTimeString).000Z"
        
        return "transactions-between?\(firstTimeStamp)&\(secondTimeStamp)"
        
    }
    
    
    private func APIGetRequest(requestURL: String, handler: @escaping (Data) -> Void) {
        
        let request = session.request(baseURL + requestURL, method: .get, headers: headers)
       
        request.responseData { response in
            switch response.result {
            case let .success(result):
                handler(result)
            
            case let .failure(error):
                // Display a warning for the error.
                self.displayWarning(error)
            }
        }
    }
    
    
    
    private func displayWarning(_ error: AFError? = nil) {
        
        var errorMessage : String
        
        if let message = error?.errorDescription {
            errorMessage = message
        } else {
            errorMessage = "An unexpected error occured. Please check your internet connection and try again."
        }
        let alert = UIAlertController(title: "Whoops!", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
    }
    
}


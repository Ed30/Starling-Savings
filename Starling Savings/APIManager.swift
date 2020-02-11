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
        
        httpRequest(requestURL: clientNameURL, .get) { result in
            
            //Extract received data from JSON
            do {
                if let contents = try JSONSerialization.jsonObject(with: result, options: []) as? [String : Any] {
                    if let accountHolderName = contents["accountHolderName"] as? String {
                        handler(accountHolderName)
                    }
                }
            } catch let error {
                Alert.genericError()
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    
    func getFirstAccountAndDefaultCategory(handler: @escaping (String, String) -> Void) {
        
        let accountsURL = "/api/v2/accounts"
        
        httpRequest(requestURL: accountsURL, .get) { result in
            
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
                Alert.genericError()
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    
    func getBalance(forAccountId id: String, handler: @escaping (Double) -> Void) {
        
        let balanceURL = "/api/v2/accounts/\(id)/balance"
        
        httpRequest(requestURL: balanceURL, .get) { result in
            
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
                Alert.genericError()
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    
    func getWeekOutboundTransactionAmounts(forAccountId accountId : String, categoryId : String, handler: @escaping ([Int]) -> Void) {
        
        let lastMonday = Date.today().previous(.monday, considerToday: true)
        let transactionsURL = "/api/v2/feed/account/\(accountId)/category/\(categoryId)/transactions-between"
        let parameters = APIParameters.transactionsRequest(fromDate: lastMonday)
        var transactionAmounts = [Int]()
        
        httpRequest(requestURL: transactionsURL, .get, parameters: parameters) { result in
            
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
                Alert.genericError()
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    
    func getSavingsGoalAmount(forAccountId accountId : String, goalId : String, handler: @escaping (Double) -> Void) {
        
        let goalsURL = "/api/v2/account/\(accountId)/savings-goals/\(goalId)"
        
        httpRequest(requestURL: goalsURL, .get) { result in
            
            //Extract received data from JSON
            do {
                if let contents = try JSONSerialization.jsonObject(with: result, options: []) as? [String : Any] {
                    if let totalSaved = contents["totalSaved"] as? [String : Any] {
                        if let minorUnits = totalSaved["minorUnits"] as? Int {
                            let saved = Double(minorUnits)/100.0
                            print("TOTAL SAVED", saved)
                            handler(saved)
                        }
                    }
                }
            } catch let error {
                Alert.genericError()
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    
    func addFundsToSavingsGoal(forAccountId accountId : String, goalId : String, amount: Double, handler: @escaping (Bool) -> Void) {
        
        let transferUid = UUID().uuidString.lowercased()
        let addFundsURL = "/api/v2/account/\(accountId)/savings-goals/\(goalId)/add-money/\(transferUid)"
        let parameters = APIParameters.addFundsToGoalRequest(minorUnits: Int(amount * 100))
        
        
        httpRequest(requestURL: addFundsURL, .put, parameters: parameters) { result in
        
            print(parameters)
            
            do {
                if let contents = try JSONSerialization.jsonObject(with: result, options: []) as? [String : Any] {
                    if let success = contents["success"] as? Bool {
                        print("FUNDS ADDED", success)
                        handler(success)
                    }
                    
                    if let errors = contents["errors"] {
                        print(errors)
                    }
                    
                }
            } catch let error {
                Alert.genericError()
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    
    private func httpRequest(requestURL: String, _ method: HTTPMethod, parameters : Parameters? = nil, handler: @escaping (Data) -> Void) {
        
        let request : DataRequest
        
        switch (method) {
        case .put:
            request = session.request(baseURL + requestURL, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
        default:
            request = session.request(baseURL + requestURL, method: method, parameters: parameters, headers: headers)
        }
        
        request.responseData { response in
            switch response.result {
            
            case let .success(result):
                handler(result)
            
            case let .failure(error):
                Alert.genericError()
                debugPrint(error)
            }
        }
    }
    
    
}


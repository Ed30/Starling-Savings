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
    "Authorization" : "Bearer \(Defaults.User.accessToken)"]
    
    
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
    
    
    func getBalance(forAccountId id: String, handler: @escaping (Int) -> Void) {
        
        let balanceURL = "/api/v2/accounts/\(id)/balance"
        
        httpRequest(requestURL: balanceURL, .get) { result in
            
            //Extract received data from JSON
            do {
                if let contents = try JSONSerialization.jsonObject(with: result, options: []) as? [String : Any] {
                    if let effectiveBalance = contents["effectiveBalance"] as? [String : Any] {
                        if let minorUnits = effectiveBalance["minorUnits"] as? Int {
                            print("BALANCE IS", minorUnits)
                            handler(minorUnits)
                        }
                    }
                }
            } catch let error {
                Alert.genericError()
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    
    func getThisWeeksTransactions(forAccountId accountId : String, categoryId : String, handler: @escaping ([Transaction]) -> Void) {
        
        let lastMonday = Date.today().previous(.monday, considerToday: true)
        let transactionsURL = "/api/v2/feed/account/\(accountId)/category/\(categoryId)/transactions-between"
        let parameters = APIParameters.transactionsRequest(fromDate: lastMonday)
        var transactions = [Transaction]()
        
        httpRequest(requestURL: transactionsURL, .get, parameters: parameters) { result in
            
            //Extract received data from JSON
            do {
                if let contents = try JSONSerialization.jsonObject(with: result, options: []) as? [String : Any] {
                    if let feedItems = contents["feedItems"] as? [[String : Any]] {
                        for item in feedItems {
                            
                            if let amount = item["amount"] as? [String : Any] {
                                
                                guard let uId = item["feedItemUid"] as? String else {break}
                                guard let minorUnits = amount["minorUnits"] as? Int else {break}
                                guard let direction = Direction(rawValue: item["direction"] as? String ?? "UNDEFINED") else {break}
                                guard let time = item["transactionTime"] as? String else {break}
                                guard let counterPartyName = item["counterPartyName"] as? String else {break}
                                
                                transactions.append(Transaction(uId: uId, minorUnits: minorUnits, direction: direction, time: time, counterPartyName: counterPartyName))
                            }
                        }
                        handler(transactions)
                    }
                }
            } catch let error {
                Alert.genericError()
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    
    func getSavingsGoalAmount(forAccountId accountId : String, goalId : String, handler: @escaping (Int) -> Void) {
        
        let goalsURL = "/api/v2/account/\(accountId)/savings-goals/\(goalId)"
        
        httpRequest(requestURL: goalsURL, .get) { result in
            
            //Extract received data from JSON
            do {
                if let contents = try JSONSerialization.jsonObject(with: result, options: []) as? [String : Any] {
                    if let totalSaved = contents["totalSaved"] as? [String : Any] {
                        if let minorUnits = totalSaved["minorUnits"] as? Int {
                            print("TOTAL SAVED", minorUnits)
                            handler(minorUnits)
                        }
                    }
                }
            } catch let error {
                Alert.genericError()
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    
    func addFundsToSavingsGoal(forAccountId accountId : String, goalId : String, amount: Int, handler: @escaping (Bool) -> Void) {
        
        let transferUid = UUID().uuidString.lowercased()
        let addFundsURL = "/api/v2/account/\(accountId)/savings-goals/\(goalId)/add-money/\(transferUid)"
        let parameters = APIParameters.addFundsToGoalRequest(minorUnits: amount)
        
        
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


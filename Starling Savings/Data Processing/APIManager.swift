//
//  NetworkManager.swift
//  Starling Savings
//
//  Created by Edward on 06/02/2020.
//  Copyright © 2020 Edward Theodor Danescu. All rights reserved.
//

import Alamofire

/**
API Manager Struct containing the main functionality for API calls.
The whole app interacts with this struct for retrieving data from the Starling API.
The struct makes use of the Alamofire library for cleaner and simplified HTTP requests.
*/
struct APIManager {
    
    let session = Alamofire.Session()
    
    // Base properties needed for all requests
    let baseURL = "https://api-sandbox.starlingbank.com"
    let headers : HTTPHeaders = [
    "Accept" : "application/json",
    "Content-Type": "application/json",
    "Authorization" : "Bearer \(Defaults.User.accessToken)"]
    
    
/// Request client's name.
/// - Parameters:
///     - handler: Clojure to which the client's name is passed for further operations.
    func getClientName(handler: @escaping (String) -> Void) {
        
        // API request URL for the client's name
        let clientNameURL = "/api/v2/account-holder/name"
        
        httpRequest(requestURL: clientNameURL, .get) { result in
            
            do { // Extract received data from JSON
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
    
    
/// Request client's first account id and default category id for that account.
/// - Parameters:
///     - handler: Clojure to which account id and default category id are passed for further operations.
    func getFirstAccountAndDefaultCategory(handler: @escaping (String, String) -> Void) {
        
        // API request URL for the client's current accounts
        let accountsURL = "/api/v2/accounts"
        
        httpRequest(requestURL: accountsURL, .get) { result in
            
            do { // Extract received data from JSON
                if let contents = try JSONSerialization.jsonObject(with: result, options: []) as? [String : Any] {
                    if let accounts = contents["accounts"] as? [Any] {
                        if let firstAccount = accounts[0] as? [String : Any] { // Only consider the first account for convenience
                            if let accountUid = firstAccount["accountUid"] as? String {
                                if let categoryUid = firstAccount["defaultCategory"] as? String {
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
    
    
/// Request account balance for a given account id.
/// - Parameters:
///     - accountId: The id of the account for which to retrieve the balance.
///     - handler: Clojure to which the balance is passed for further operations.
    func getBalance(forAccountId accountId: String, handler: @escaping (Int) -> Void) {
        
        // API request URL for the account balance
        let balanceURL = "/api/v2/accounts/\(accountId)/balance"
        
        httpRequest(requestURL: balanceURL, .get) { result in
            
            do { // Extract received data from JSON
                if let contents = try JSONSerialization.jsonObject(with: result, options: []) as? [String : Any] {
                    if let effectiveBalance = contents["effectiveBalance"] as? [String : Any] {
                        if let minorUnits = effectiveBalance["minorUnits"] as? Int {
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
    
    
/// Request the list of all transactions executed since last monday.
/// - Parameters:
///     - accountId: The id of the account for which to retrieve the transactions.
///     - categoryId: The id of the category the transactions have to belong to.
///     - handler: Clojure to which the list if transactions is passed for further operations.
    func getThisWeeksTransactions(forAccountId accountId : String, categoryId : String, handler: @escaping ([Transaction]) -> Void) {
        
        // API request URL for the account balance
        let transactionsURL = "/api/v2/feed/account/\(accountId)/category/\(categoryId)/transactions-between"
        
        let lastMonday = Date.today().previous(.monday, considerToday: true)
        let parameters = APIParameters.transactionsRequest(fromDate: lastMonday) // Request parameters based on initial transaction date
        var transactions = [Transaction]() // Initialise Transaction list
        
        httpRequest(requestURL: transactionsURL, .get, parameters: parameters) { result in
            
            do { // Extract received data from JSON
                if let contents = try JSONSerialization.jsonObject(with: result, options: []) as? [String : Any] {
                    if let feedItems = contents["feedItems"] as? [[String : Any]] {
                        
                        // Loop through all retrieved transactions
                        for item in feedItems {
                            if let amount = item["amount"] as? [String : Any] {
                                
                                guard let uId = item["feedItemUid"] as? String else {break}
                                guard let minorUnits = amount["minorUnits"] as? Int else {break}
                                guard let direction = Direction(rawValue: item["direction"] as? String ?? "UNDEFINED") else {break}
                                guard let time = item["transactionTime"] as? String else {break}
                                guard let counterPartyName = item["counterPartyName"] as? String else {break}
                                
                                // Append current Transaction to the list
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
    
    
/// Request the amount saved so far for a particular goal id.
/// - Parameters:
///     - accountId: The id of the account for which to retrieve the goal.
///     - goalId: The id of the goal for which to retrieve the amount.
///     - handler: Clojure to which the amount is passed for further operations.
    func getSavingsGoalAmount(forAccountId accountId : String, goalId : String, handler: @escaping (Int) -> Void) {
        
        // API request URL for a particular goal
        let goalsURL = "/api/v2/account/\(accountId)/savings-goals/\(goalId)"
        
        httpRequest(requestURL: goalsURL, .get) { result in
            
            do { // Extract received data from JSON
                if let contents = try JSONSerialization.jsonObject(with: result, options: []) as? [String : Any] {
                    if let totalSaved = contents["totalSaved"] as? [String : Any] {
                        if let minorUnits = totalSaved["minorUnits"] as? Int {
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
    
    
/// Request the transfer of funds to a particular goal.
/// - Parameters:
///     - accountId: The id of the account for which to retrieve the goal and from which to perform the transfer.
///     - goalId: The id of the goal to which the amount has to be transferred.
///     - amount: The amount to be transferred.
///     - handler: Clojure to which the success state of the operation is passed.
    func addFundsToSavingsGoal(forAccountId accountId : String, goalId : String, amount: Int, handler: @escaping (Bool) -> Void) {
        
        let transferUid = UUID().uuidString.lowercased() // Generate UUID for the transfer to ensure idempotence.
        let addFundsURL = "/api/v2/account/\(accountId)/savings-goals/\(goalId)/add-money/\(transferUid)" // API request URL for adding funds to a particular goal
        let parameters = APIParameters.addFundsToGoalRequest(minorUnits: amount) // Request parameters based on the desired amount
        
        // HTTP Request with PUT method
        httpRequest(requestURL: addFundsURL, .put, parameters: parameters) { result in
            
            do { // Extract received data (response) from JSON
                if let contents = try JSONSerialization.jsonObject(with: result, options: []) as? [String : Any] {
                    
                    if let success = contents["success"] as? Bool {
                        handler(success)
                    }
                    if let errors = contents["errors"] {
                        debugPrint(errors)
                    }
                }
            } catch let error {
                Alert.genericError()
                debugPrint(error.localizedDescription)
            }
        }
    }
    

/// Perform an HTTP Request with the specified parameters.
/// - Parameters:
///     - requestURL: API request URL for the specific task.
///     - method: HTTP method to be used for the request.
///     - parameters: Optional parameters for the request.
///     - handler: Clojure to which the response data of the request is passed.
    private func httpRequest(requestURL: String, _ method: HTTPMethod, parameters : Parameters? = nil, handler: @escaping (Data) -> Void) {
        
        let request : DataRequest
        
        switch (method) {
        case .put: // Encode the given parameters as JSON
            request = session.request(baseURL + requestURL, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
        default:   // Encode the given parameters in the request URL (default method)
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


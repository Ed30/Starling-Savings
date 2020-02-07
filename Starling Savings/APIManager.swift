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
    "Authorization" : "Bearer \(User.accessToken)"]
    
    
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
    
    func getAccounts() {
        
        let accountsURL = "/api/v2/accounts"
        
    }
    
    
    func getBalance(forAccountId id: String, handler: @escaping (Double) -> Void) {
        
        let balanceURL = "/api/v2/accounts/\(id)/balance"
        
        APIGetRequest(requestURL: balanceURL) { result in
            
            //Extract received data from JSON
            do {
                if let contents = try JSONSerialization.jsonObject(with: result, options: []) as? [String : Any] {
                    if let effectiveBalance = contents["effectiveBalance"] as? [String : Any] {
                        if let minorUnits = effectiveBalance["minorUnits"] as? Int64 {
                            let balance = Double(minorUnits/100)
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
    
    func getTransactionsBetweenDates(startDate: String, endDate: String) {
        
        //Remember to also attach queries for dates
        let transactionsURL = "/api/v2/feed/account/{accountUid}/category/{categoryUid}/transactions-between"
        
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


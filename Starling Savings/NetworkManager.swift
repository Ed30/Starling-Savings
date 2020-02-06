//
//  NetworkManager.swift
//  Starling Savings
//
//  Created by Edward on 06/02/2020.
//  Copyright © 2020 Edward Theodor Danescu. All rights reserved.
//

import Foundation
import Alamofire

struct NetworkManager {
    
    let baseURL = "https://api-sandbox.starlingbank.com"
    
    let headers = [
    "Accept: application/json",
    "Authorization: Bearer \(User.accessToken)"]
    
}

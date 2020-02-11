//
//  Transaction.swift
//  Starling Savings
//
//  Created by Edward on 11/02/2020.
//  Copyright © 2020 Edward Theodor Danescu. All rights reserved.
//

import Foundation

struct Transaction {
    
    let uId : String
    let minorUnits : Int
    let direction : Direction
    let time : String
    let counterPartyName : String
    
}

enum Direction : String {
    case inBound = "IN"
    case outBound = "OUT"
}

//
//  Defaults.swift
//  Starling Savings
//
//  Created by Edward on 11/02/2020.
//  Copyright © 2020 Edward Theodor Danescu. All rights reserved.
//

import UIKit

/**
Defaults structure containing global variables and constants.
*/
struct Defaults {
    
    
/// User-related constants
    struct User {
        
        static let accessToken = "eyJhbGciOiJQUzI1NiJ9.eyJpc3MiOiJhcGktZGVtby5zdGFybGluZ2JhbmsuY29tIiwic3ViIjoiNjNhNTJhNGUtOGM1Zi00ZDA1LWFmMTAtYzhkMTA4MmYwNzczIiwiZXhwIjoxNTgyMDIyMjUwLCJpYXQiOjE1ODE5MzU4NTAsImFjY291bnRIb2xkZXJVaWQiOiI0OWJjY2IzYy05MDI5LTQ1YWUtOTYwNi1kYzMwNTk2OWMwYmQiLCJ0b2tlblVpZCI6IjRlOWRkNGE0LWVhMGYtNDEwMC04ODExLTQ2NjRiOGM2N2I2OCIsImFwaUFjY2Vzc1VpZCI6IjA1MmU1OTNhLTg3OWEtNGUwYS04YmI5LTZkODA3NmYzZTNlMSJ9.QlLwnGN36xscMHz-lNibEdddCPAD14QkbE_RpJBBP-l9XesB-pc5fRIBHeSW27uc9thu4qM4V9IqvGr8Ip0Dbm5fRKjeYRPAzxv58NJ8mvB6_nUNDVdgZ9-tmetzwpDWdw0esg3emVY8zRcPlzdrnHXrT1hEmM5tOGQ5neEQ8OejOIo9O5jt1cdUYjl26FIbfm8PD6zOyOdYfk3OblGtx_3xJpRQB1mrQcefwVTp4A-3oxGQzmabsiDtIg9shrmVAuH8eC_2RJ3ZVMyRSxCPxuYHWc5m79NYNcQ5NxQCq3fKcpFGBOM3S7TiGZO3YMSyPH3Dmxojg1GE139Lb5D3SrM9pkPFt2C77aGAg-V8K5Y7MmAftBQo9VqnVE-IGBsGgPA4gWo98DjgD5rbGeKvQ28ZgOcg9A2WPOD-od8f-Ev1t0v0hu691EUbStenELuViEzPwCVpHmvgao9hQLHm5q5pU7uggJIWrVh7mVhxsyjNORH3C4v6hpkXrie4JiFL8SCvI51e0dk7fVB4JIUp4GNCTaUiwGCclEucLNO9ifncAf8Ug5fxcLJjNTstcmLOAntEpPGpPMNw-j99bh7qePLluyQW8t43nkm68aPoBXUjkrPIAGgwzx7xlyzsMP9XJ2qkw4_XN5aIvl05LrB9Y-dU7oAXzaY1Zj-1B-OBkUw"
        
        // These were hardcoded here for convenience
        static let savingsGoalId = "06422945-a306-44bd-8034-5686f7834199"
        static let savingsGoalTarget = 100000
        
    }
    
    
/// UI constants
    struct UI {
        static let profileImageCornerRadius : CGFloat = 48
        static let viewCornerRadius : CGFloat = 15
        static let shadowRadius : CGFloat = 15
        static let labelUpdateTime = 1.0
    }
    
    
/// Other global variables and constants
    static var savingsScreenNeedsUpdate = true // Specify whether the savings screen needs to refresh
    
}

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
        
        static let accessToken = "eyJhbGciOiJQUzI1NiJ9.eyJpc3MiOiJhcGktZGVtby5zdGFybGluZ2JhbmsuY29tIiwic3ViIjoiNjNhNTJhNGUtOGM1Zi00ZDA1LWFmMTAtYzhkMTA4MmYwNzczIiwiZXhwIjoxNTgxNTMzODM2LCJpYXQiOjE1ODE0NDc0MzYsImFjY291bnRIb2xkZXJVaWQiOiI0OWJjY2IzYy05MDI5LTQ1YWUtOTYwNi1kYzMwNTk2OWMwYmQiLCJ0b2tlblVpZCI6IjJlZDFlODdkLTBhOWMtNDlmNi04MDJlLWY0MDkyOWNlNzdhMiIsImFwaUFjY2Vzc1VpZCI6IjA1MmU1OTNhLTg3OWEtNGUwYS04YmI5LTZkODA3NmYzZTNlMSJ9.e91FptRIr_hAGGmEjpDfcgDN4lhnqzHDohxudtfQebxQY_AYPNlkK2xPNODPoZqWPKmD7ckPfyjT-uKUney3_ARPec48VbnAGa6C8VQ_6yYb-FfcoiX6GyJJjiR5tbK8hmH5JkUYv-2y4JrgMhWeyxKYltYfMXybrE8TikrPKNS84HKMmyAVQ8HhK0URbPPMEMjZtnEs3T3JQbx83_xzItTY4TuuycWotuLHyi9OCo4hQ3zxVn8eWqlFyFnwdZ2d6dhOcQPdAP3p6v-M5_7cIuq5JXey23ZZ_1lq3_-hO6EVQdRzMMEn4R3yD_m-h8uEjer7_NSmShEyHXIaKMnhJqQAUrBeRqxCeT6G7W5VxN4B7nNut8dW-cpYEKndpgtN8_3J_pTvMmF3D4No_IyFYHz_i_K0WxyHCjFIiyvNf0gENgW0NlXz0zm9mYgmXAKeQ9X6Zv0JR03nSlvAdFr_FIpgwmx8-CNcRXbA8pMaAhP26VspSwVgWeKFUoH6k7rvVyOBx7CDUcgLve8ZC0QevTfVh5zQaimV3nu303HcKk-hpa2MUkmUR-FMzn_aJJv7WzV2Z3X5qlOAnOyMg1Xb48xrRzqTMEV0t_MO4kQ-rJBw7Z1GamoHDqgszVjyBvxV7RP-s9akWt8VIKPq6w4vezcFNdYfEq-AnCZa7H9rBcQ"
        
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

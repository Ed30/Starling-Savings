//
//  Defaults.swift
//  Starling Savings
//
//  Created by Edward on 11/02/2020.
//  Copyright © 2020 Edward Theodor Danescu. All rights reserved.
//

import Foundation
import UIKit

struct Defaults {
    
    //User-related constants
    struct User {
        
        static let accessToken = "eyJhbGciOiJQUzI1NiJ9.eyJpc3MiOiJhcGktZGVtby5zdGFybGluZ2JhbmsuY29tIiwic3ViIjoiNjNhNTJhNGUtOGM1Zi00ZDA1LWFmMTAtYzhkMTA4MmYwNzczIiwiZXhwIjoxNTgxNTA3NjI2LCJpYXQiOjE1ODE0MjEyMjYsImFjY291bnRIb2xkZXJVaWQiOiI0OWJjY2IzYy05MDI5LTQ1YWUtOTYwNi1kYzMwNTk2OWMwYmQiLCJ0b2tlblVpZCI6IjJkMWNlYTRiLWFkYTUtNDlkNS05NjQxLTlhYmQxNDYzYWRmNiIsImFwaUFjY2Vzc1VpZCI6IjA1MmU1OTNhLTg3OWEtNGUwYS04YmI5LTZkODA3NmYzZTNlMSJ9.UN80ycKkAeBNLKy58V_jmPfOaLxAtvMObH2aiYRM2HdSQ4FWm3RCXp_4eflaCkUn0W3iW9ye_Qm917KZKrKZkeEw_icooZGvQRokYMAqrY8k-9_neDrlaCwrmh7_FScSBG9ZXtNlcokWqWfSCHDpjrD6MuXAb6zvXcN5tPSbXwdG3P8r0VpIeROhg6MFvhN7V4U2qy5BfUht-V8lzsDwPUosEGp5QWsIwyPW7S-5Yb0MXeMMwM78s_jai9TPL4F8Fe5W47q46jsv7Mm_MDFwX2IYVR5eYm1-BdeGypYsATZQq8rGS-J8VQ9WW_lTiOAtt0fGPxTJ-U4eq1Oi04nmW43Yo_AnuPfhR_kKtPUN2suTDemIcby-diuESvOFCYUBbCwqh9S5wHnlgmRJeokiYFYDzjpdATi8iw90vicSFm8lFuMSF50TaP2Zyi7PqRXC0-kr-vX1DqxDyWF3hJ1ljm6s1jM7OdHMcvbySCjiRuDy3-EKSO-JCdeP9oJeJbXHe4V5A0sIfDb6-oXUDQmW5rd5YJXCpc8nxpnPuwsnHsqm_EOgbMJNXUyBEYUmN3frXbLJXCJIWQMk4OHsLfJgEINuyw17SzJ5r9xNTNpscnsFJFMYw2gZ-rcGy0xnsWx6Kp6CodfHGxbxT7wyWEc-kuR0NGL5goRc6TqIvhbZQvE"
        
        static let savingsGoalId = "06422945-a306-44bd-8034-5686f7834199"
        
        static let savingsGoalTarget = 100000
        
    }
    
    
    //UI constants
    struct UI {
        static let profileImageCornerRadius : CGFloat = 48
        static let viewCornerRadius : CGFloat = 15
        static let labelUpdateTime = 1.0
    }
    
    
    //Other global variables and constants
    static var savingsScreenNeedsUpdate = true
    
    
    
}

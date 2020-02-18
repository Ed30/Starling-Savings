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
        
        static let accessToken = "eyJhbGciOiJQUzI1NiIsInppcCI6IkdaSVAifQ.H4sIAAAAAAAAAH1Ty5KbMBD8lS3OO1vCPAzccssP5AOG0WCrDBIlCSdbqfx7BAJjnK3c6O6ZVo9G_E6Uc0mT4KhA8mA-nEfbK31pUd8-yAzJe-KmNlSUGRYnzBkqKjrIpSgAu1QAVTIV1akT53MWivnXmDRpUZ3StDiL9D1R6CMhTnU2E0hkJu2_m16y_aFk8M7rlqjNCOpQBHmBDHUpSpCUiaIuaxKtDN7e3FjHjiJvs7YUEkRViJCGMmhTyZAJEucuxyIXbegIY30jYudilyhOXNQZQnWuEXIW4attayhlJc5ll3HG6TwwmZHnS4lJ4bpEBY0DN5ZRvr0I_nN8EZRk7VWn2B75Xjl_YFYgpQ0hG5bKP0BUvEe6Dvyo3PFPqzy_4eSvxioXVgZKS3VXcsI-FrfYo6Y1GqGVQEZ7a_p40MysmtGdsgN6ZTSYDrpJS_eQ3ON0mpw3wzYUD6hWqwG1RM-N5J5DqA0uZQPaG_s532i5Y8shkvufFAeL2tgjcRjM88Uu8Z4b_xXXVrZ0xS30wB5DGmwowEVd8ZJ8xE_mTYpgHSKCvQjUgJd1pqhtn9BO_a3ZNsE7tdtGvDtH_DDoDYWlPZUvBJh5e6_s2mVNp_otVEx5oJYqy8Rq9AfgjlK8Mof3sAYHF7PnOHBr9AO3-Dwz4C1qFxb5lcUufuG1i9HUhxc0vwtj5ZPbkd1sjuzW73n-S4Dc_ZUaZbdSU-vIhkt4vKslBdJCLHf6TMwVyZ-_fKwiyDIFAAA.OMCDeLlEsQa48wMGzHZP-9X81sZx5G8ZiqMmMuRPDqoJVxN_JTo21wGfewnznU-Ma1rHdHY7lGDg1FzfaAC2wRhEWEO57Tk7pZKZicowX87cdjK14LrnDTyInmjDsCkoGrkqRW3lVwg8rvGhBcC4YNYgTfM4dQSTNH5e7gAy7uJVpGvZxP95IBsKEnFm5FZiMHpWx6RfM79Qtwpm0gooclqtzYpExkwC6VkwOpUTdRbFbuLd7urgqzANP8fgLe-UHJIc6HlAvPVMPhh8h-DLmwfJwx2RNghH3xoExFMItJSn-uDV1yzZl5Qk4vQfsNyhwW2zuGdlSlehuaALNJN0Lnm9BuJ2Y35aSvelD7hDAT-oj_SkzF7zqCXyqLg_QOBePgrPA8f0r2Fr9fIsMCqrYBFQMKqnl4Ki6q07vV7FEqCddDDFiQmonENPMuTqlBpEONTm0-eVhr3bW1wA_eGwggCSjydCXst0fUiwXNlHC3MuI5-AKJvz6Jf3CzYbJLGyRr2UxFOSUxuRpYCu-e8Q6fnjWKGGyMW_H2D6Ye95LVqhRWueEvnoVQShyUxEF3f1T9bTeiQaVP_4EYy5Pjg8BiVoBfeWhn4JM_7Oc7o-0ipjUQ-gPEzTUNsOnR7b2IUMhDmlOHAJYayRJknL-hllDc_kZ6h9VBqZ9QVHnB3CXZc"
        
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

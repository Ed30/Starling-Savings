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
        
        static let accessToken = "eyJhbGciOiJQUzI1NiIsInppcCI6IkdaSVAifQ.H4sIAAAAAAAAAH1Ty46cMBD8lRXn9crA8Lzllh_IBzTt9ow1YCPbTLKK8u8xmMcwWeVGVXWXq93md6KcS9oERsUEDebDebC90tcO9P0DzZC8J27qQkWZQ5HBhViNhWQXwQsGMuUMa5HyOpO8qvJQTL_GpE2LOsvqKs2y90SBXwnOq5kARDNp_930guwPJYL3pekQuxxZw7OGXQog1pS8ZAJzXjRlg7wTwdubO-nYUUiBKKFgZVeHNEWTMUCRsjLnPJVphUAQOsJY3xDJudjFi4yKJgdWVw2wC_Hw1XUNK0XNq1LmlFM6D4xmpPlSYlJ2W6IyDQO1lkC8vQj-c3wRlCDtlVRkz3yvnD8xKxDChpAtCeV3EBXvAW8D7ZUH_mmVpzeY_M1Y5cLKmNJCPZSYoI_FHfSgcY2GYAVDo701fTxoZlbNaKnsAF4ZzYxkctLC7ZLbT8fJeTNsQ9EAarUaQAvw1ArqKYTa4FI2gL2Tn_ONliRZCpHc_6Q4WNTGHpDCYJ6udon33PivuLaSxRtsoQfyENJAiwEu6oqX5CN8Em1SBOsQERxFTA1wXWeK2vbJuqm_t9sm6KAO24gP54h3g95gWNpT-UIwM2_vlV27rJGq30LFlCdqqbKEpEZ_Au4sxStz8AhrcOxqjhwnbo1-4hafZ4Z5C9qFRX5lcYhfeB1iNPXhBc3vwljx5HZmN5szu_V7mv8Shu7xSo1CrtTUObThEvZ3taQAXIjlTp-JuSL58xeqcg2BMgUAAA.XSh__ipzT1cjelCbNRMXRznKT5Va0LTzODAk7aLGRfsBrWCE56wCqJ_q8V9wduO1yLqs_G1O7Fzp3C1823eUX1fvxtk25boEPOebY4uZYOaJu-kEt2RwivEei8Vj-9dSnymO4SXV8lqBteLqYAyT_asEKOxZpqk7_fjcedsIULgp90mnkYjefbMGBFocyB30WOU9rewc_RIrr9LTQ8FxS_9vB3EeSnyFL6LNe6YckKv9Blqf-hcm9jdHF7Lk3FAQlrsuxuMA51coYjJdqgJ6QCyGCjpADupn8ztsQjBfZ9HYYIcXQnTZRecjbcid6duyT7G3QhnlI0W8l-edModXJviRDivhcdTQWzgDBayeZNWTv5F9Tta0W7MxZrjJ0dNStf59n6U-gqAPP2ipgcjPA6w7q2hEkfrphqcgCEqIMo76mlRSHmKPURPVp7T8E_fywrrCQ-ZPppo_6Fr14z2YmjCCp5i-bRg-bvlmWo6Hqqeg_b45d939RsZ_tCykVXk2ZVK0HJV5y9t25yTqq3rMjz-kKCuf63hp-g59D-DmnKKiCQLHnYzrfImNJxb463KvGwsRljrv3FvkZnDw8LFqo3lQLdezs6LsMN4fcGyKO9M4BqiiTKxYDtkJb_nipzbTyHFYxIJ_1hKRsox4WBSFJEwJOc8s6glCTqG1gZSJSrI"
        
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

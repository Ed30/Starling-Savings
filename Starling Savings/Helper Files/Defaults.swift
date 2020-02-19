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
        
        static let accessToken = "eyJhbGciOiJQUzI1NiIsInppcCI6IkdaSVAifQ.H4sIAAAAAAAAAH1TQZKbMBD8yhbnnS0BBgO33PKBPGAYDbbKIFGScLKVyt8jEBjjbOVGd8-0ejTid6KcS5oERwWSB_PhPNpe6UuL-vZBZkjeEze1oaLMscjwxFBR0cFJigKwSwVQJVNRZZ04n_NQzL_GpEmLKstEJorsPVHoI5GmRTkTSGQm7b-bXrL9oWTwPtUtUZsT1CKr4VQgQ12KEiTloqjLmkQrg7c3N9axo5jDcHcOxxPCqZQydKQpCM7zFGsZzNrQEcb6RsTOxa4QiIs6R6jOdehiEb7atoZSVuJcdjnnnM4Dkxl5vpSYFK5LVNA4cGMZ5duL4D_HF0FJ1l51iu2R75XzB2YFUtoQsmGp_ANExXuk68CPyh3_tMrzG07-aqxyYWWgtFR3JSfsY3GLPWpaoxFaCWS0t6aPB83MqhndKTugV0aD6aCbtHQPyT1Op8l5M2xD8YBqtRpQS_TcSO45hNrgUjagvbGf842WO7YcIrn_SXGwqI09EofBPF_sEu-58V9xbWVLV9xCD-wxpMGGAlzUFS_JR_xk3qQI1iEi2ItADXhZZ4ra9gnt1N-abRO8U7ttxLtzxA-D3lBY2lP5QoCZt_fKrl3WdKrfQsWUB2qpskysRn8A7ijFK3N4D2twcDF7jgO3Rj9wi88zA96idmGRX1ns4hdeuxhNfXhB87swVj65HdnN5shu_Z7nvwTI3V-pUXYrNbWObLiEx7taUiAtxHKnz8Rckfz5CyzFfLIyBQAA.v1nexJGuREACu2i8ZiU8iLM1c41St42k1L6rNr8RRl7Vyfr_rR0Njkf0iJnVcxdKoSoRhZNuaGRLRM28oQfkElCE9tQwbRXvu03Y5eo7DcgxnESujyO_x2lBlnbUR2zfTyX47W0lWOIY5XVl9Avo2KpdHuRgMRpemx_5OZzuwQFrabwtGaob5JqSuctkZRfRLKXxubZCnbhjCxl5pN-4xkEtDe7EILeKw6rwqVX4t3SeQVtc7nZ3yTTbk3xaotC6y3fufxQw0EqcklL6JJ5fAQG8FV1uYzoSwDQNOah4ym-8mxrqsKAb_x5naSsujmMpV49-IYnwgLmTRBdwUPGEBgWq4Nj2AucpSDpVz71qjFp7WM9xkeKW6cPbJY1l5l9fCVvC8W-SGZW43CyiZ6HOOb03KJSmR_rBVMhAEfH_qdGTXapA0d6ooWnk3qp_7zPakV44IpXTMIjewsz7ALNjXc4foe3i5ODDIhTOtuW_Iu0FQKVffj07QQkWtm3s0qLxYOmRoM3h1G260opD-nu1av1tFkIbdJC3BZrBO5JUCr2pCDHWxORCQLzY1GmXYfHqGsOW--2LnVZ-R7g5mIBJ7-HIL4QR94842XuqZj6Mpd4kKnUp9O8XMMGUYjEIMmy0Qm0JCtGs8UjhTgBflbV57dCvrJEm1Y_kLK2u9RrxyNg"
        
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

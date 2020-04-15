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
        
        static let accessToken = "eyJhbGciOiJQUzI1NiIsInppcCI6IkdaSVAifQ.H4sIAAAAAAAAAH1TQZKbMBD8yhbnnS2MAAO33PKBPGAYDbbKIFGScLKVyt8jEBjjbOVGd8-0ejTid6KcS5oERwWSB_PhPNpe6UuL-vZBZkjeEze1oaIUWGSYM1RUdJDLtADsTilQJU9plXXp-SxCMf8ak-ZUVOc0F0IU74lCvxBlXZT1TCCRmbT_bnrJ9oeSwTuvW6JWENRpVkNeIENdpiVIEmlRlzWlrQze3txYx466qLKqQwRBhYD8HNK0GZVQiXOGJE-VaDF0hLG-EbFzsSstMi5qgVCda4Sc0_DVtjWUskrPZSdY8GkemMzI86XEpHBdooLGgRvLKN9eBP85vghKsvaqU2yPfK-cPzArkNKGkA1L5R8gKt4jXQd-VO74p1We33DyV2OVCysDpaW6KzlhH4tb7FHTGo3QSiCjvTV9PGhmVs3oTtkBvTIaTAfdpKV7SO5xOk3Om2EbigdUq9WAWqLnRnLPIdQGl7IB7Y39nG-03LHlEMn9T4qDRW3skTgM5vlil3jPjf-KaytbuuIWemCPIQ02FOCirnhJPuIn8yZFsA4RwV4EasDLOlPUtk9op_7WbJvgndptI96dI34Y9IbC0p7KFwLMvL1Xdu2yplP9FiqmPFBLlWViNfoDcEcpXpnDe1iDg4vZcxy4NfqBW3yeGfAWtQuL_MpiF7_w2sVo6sMLmt-FsfLJ7chuNkd26_c8_yVA7v5KjbJbqal1ZMMlPN7VkgJpIZY7fSbmiuTPX64_HFQyBQAA.AOFonFuEYAmNScNPXKab2E3ldslgC3UO0AHOTZb3h05SbNbwiJUarPHKWwZfa06Oj3pZx_mjsjkHDYkUVMx6EzZDu2gfyROUKeoIm0Z3bq27gYBssm7RTBEqOzDPywkfEp_SY0foIKG-jAiDXd0LUD-qJXyy96b4pXpjJWr3S21NTTuc8DBo4Qlc6ip9bEL-oRY3tn1-D7QAdeGmLFQai2TQdcEotdrVj9we36VQ-ICamc95DaXY5_INfllmexvtLIKyUHUb-4WIkKsJmHgB6_sY6oEk_ewYMa2zi8v5F-R6zXP4TnWvR9rkPNgKkjhpWZV_Md7yO_x8cnyox2slWUw0mEDHYffU3BPXMaDSdlHf8XwMdLmZe3oZxsSA2TtuaDODki2lZKtxQdIkmlAMhvOuk3AchvEtSOsaZ9hh7dD_WFQVzYO9JJvyt94N-KLCrYRQVVdju4Cv1mSKM6h89Fcprg_la461PqTIxf1dGmb2pKdghQ_YQawHBM7VcZq7UQQoSNh5NLGidoAaRc8mdapzIRykpscjEvPaMRkWJCItPy_qJuEKzWjKJv-T9RjHZb6YY5NnXSY7h26Ex-7-lKxZlPCxoqFQrS8Iu5lnXOUaVxOW8P87l1VesCmeD05XfloXQfFpNnw9NCizLNgj6bCGlfY9MX3YRCWWxj0d_hI"
        
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

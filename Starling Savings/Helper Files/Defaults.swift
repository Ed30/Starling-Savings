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
        
        static let accessToken = "eyJhbGciOiJQUzI1NiJ9.eyJpc3MiOiJhcGktZGVtby5zdGFybGluZ2JhbmsuY29tIiwic3ViIjoiNjNhNTJhNGUtOGM1Zi00ZDA1LWFmMTAtYzhkMTA4MmYwNzczIiwiZXhwIjoxNTgxNjI5NzczLCJpYXQiOjE1ODE1NDMzNzMsImFjY291bnRIb2xkZXJVaWQiOiI0OWJjY2IzYy05MDI5LTQ1YWUtOTYwNi1kYzMwNTk2OWMwYmQiLCJ0b2tlblVpZCI6IjM1MTBiYTVjLTU0MzAtNDgxNi05ZWE4LTllNWMzY2FkZjI2MyIsImFwaUFjY2Vzc1VpZCI6IjA1MmU1OTNhLTg3OWEtNGUwYS04YmI5LTZkODA3NmYzZTNlMSJ9.Mo0CbRNLRFYaYMyC32ILz7mddYFf7h2scWxmMnNVWtGqCknZx7ZDrMx-_BmpYLW5bRyDxD9Wt1dZNqXQRDgmp8w2IQZIR2nvTNBSKl457yfhG5Zzq5HnGjUijoh6viPcFomvH0pi8_xaKwzUS8iQOOwxLLX-L8w76cRY_0C-12mzyKPQfdjvzENM-AukGoZtlH6k8jJ20s2-ll5tFyG0GMK0l1hcFIlaCuB7qp4urTlsLdiwAvVFHbwW33_uRhmcqEL3hoFNalLYJIi-IObJp2P0J1_xV1oaTbZBRewxg0y1i527JaPXK_jVlWtw_Sy_u31SbTnMIgH9e407hJzkpFFLyqVLI0zph9ghGcNMpjsGgGN7AqDe5NdyJc5O8Uk-gxaReIg_UkcCns3ZwFANTMmSVgkvbQ8c--L1AvVnA4dpvU0-Jvs5hZqvvygJltmMnVGBhsGY2JIPEKiDhaJrZjG39d2J6fhjJUCmgw3gA5gsAIdFt7XqFGiP9h20VbRsPF9vwAnqIYY6_8O0_YsFfXWHVpcOOu3JZk5j308vqo_CRsGttaJrOpcIfJh99FnsARSy7Ka2gzrsAq2joDeI3aHTWcb6xnwz11TYMygF-GIYdKmqcyiZX_hBPXPNiCY2VZ2yRUyKHSQti1vnwr3HpFmuZbvZK9BHjwc42x3HK5E"
        
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

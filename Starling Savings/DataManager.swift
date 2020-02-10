//
//  DataManager.swift
//  Starling Savings
//
//  Created by Edward on 08/02/2020.
//  Copyright © 2020 Edward Theodor Danescu. All rights reserved.
//

import Foundation

struct DataManager {
    
    let userAccessToken = "eyJhbGciOiJQUzI1NiJ9.eyJpc3MiOiJhcGktZGVtby5zdGFybGluZ2JhbmsuY29tIiwic3ViIjoiNjNhNTJhNGUtOGM1Zi00ZDA1LWFmMTAtYzhkMTA4MmYwNzczIiwiZXhwIjoxNTgxNDIxMDk2LCJpYXQiOjE1ODEzMzQ2OTYsImFjY291bnRIb2xkZXJVaWQiOiI0OWJjY2IzYy05MDI5LTQ1YWUtOTYwNi1kYzMwNTk2OWMwYmQiLCJ0b2tlblVpZCI6IjI3N2E0NzRmLTMwZTMtNDMxMC04MzRkLTE4MTZmMWNiYzE2NCIsImFwaUFjY2Vzc1VpZCI6IjA1MmU1OTNhLTg3OWEtNGUwYS04YmI5LTZkODA3NmYzZTNlMSJ9.xEGPwBg2ULlYR1uFqkha0lzX5IHrvzV_O9AFgGiXnVuvtC94afTFtyL_Rz6JSZTG_vcS7mgagTZ-7F2JmIETQwYhwbAjrCMW3r57s2DgYeBqTivH2543981DMjc8SaDCqr5xNJaYNPwb94x3YFEGUPE7C0gGJp7ogWHzzWEI0eIjbfhkbaG6meSdeNdcwfp8h3tua9DjE15xesx_xsK1XbfnecJSxHxdsLO1BHwf3y5j6W3JnZhe7tYaqpOuU3cVFhkBsKoxSuNYerD5E63jBBlXQGSacGDxFZJd-h9cJHglgKQNAoblElDZI9JgiA1nwkM7Sf8Ce9m4bFK0PElcUTU897DfhasK-E645dASy-1qR_woMf7afWfagXiiOxBry1P20ksyTpzZgLaDefiYoK17YQwiPbBVypIdZVZPtmdH_Qafi4HhRaDWqI-S0rx4RCWJFmQ6csvCVdxluXSEVYXXOh4LnHxrR5MgvkJJbucTpoczrz2ZxGmVN65vknBhf1zuFLBnT44d_KjA0CLUs3YbNcF6rRUqS_EwPhN9DHLM0ehUB64g-P2RMSZHfbAPt6IDqFs4sJEN8zI_5nmaovd1xVNkQpbEFtvtQqsph4k8gYLsj1uKHDY780PQ5oZkF-agf8jimV88j__ASOZm5wELCh6fpRLR6tA5FG2ireo"
    
    
    let savingsGoalId = "06422945-a306-44bd-8034-5686f7834199"

    func aggregateRoundups(forMinorUnits transactions: [Int]) -> Double {
        
        var totalRoundups = 0
        print(transactions)
        for transaction in transactions {
            let reminderMinorUnits = transaction % 100
            if reminderMinorUnits != 0 {
                let differenceToNextMajorUnit = 100 - reminderMinorUnits
                totalRoundups += differenceToNextMajorUnit
            }
        }
        return Double(totalRoundups)/100.0
    }

}

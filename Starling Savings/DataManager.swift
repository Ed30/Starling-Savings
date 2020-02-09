//
//  DataManager.swift
//  Starling Savings
//
//  Created by Edward on 08/02/2020.
//  Copyright © 2020 Edward Theodor Danescu. All rights reserved.
//

import Foundation

struct DataManager {
    
    let userAccessToken = "eyJhbGciOiJQUzI1NiJ9.eyJpc3MiOiJhcGktZGVtby5zdGFybGluZ2JhbmsuY29tIiwic3ViIjoiNjNhNTJhNGUtOGM1Zi00ZDA1LWFmMTAtYzhkMTA4MmYwNzczIiwiZXhwIjoxNTgxMjc0MjU0LCJpYXQiOjE1ODExODc4NTQsImFjY291bnRIb2xkZXJVaWQiOiI0OWJjY2IzYy05MDI5LTQ1YWUtOTYwNi1kYzMwNTk2OWMwYmQiLCJ0b2tlblVpZCI6IjFkZWFhYTdlLTNjMmQtNDJjNy1iMDgwLTNlYzBmMmFhYTdmYyIsImFwaUFjY2Vzc1VpZCI6IjA1MmU1OTNhLTg3OWEtNGUwYS04YmI5LTZkODA3NmYzZTNlMSJ9.SqEwliW_35JcTsugw7PrdKT8KJVqn331ueCQGqLZ1JvYx7NirAhcuH-hXJ1gW4sj58ED6RTKu054yeW7Toz6Mmnj8GMoGqU0XFe02u2J_P3iMEeTcSUHNZD2FLmsY4z09Ki6Lat87Ag9PD7dXmupThZ8QBiU4Jtq0IHdHOAFYUcPGsiwWIR9xkbMDAblOS4vkV_p1OJzVyoJXj9ylboSrb6WRoGfRZEBNOX_8GehIdYYBhpwxX4psHbVR7GYPi3mUrkzFp9JcBB0S-MiesrVVp01auQ7R-q8IPNsuECdqNI3jtgA89mq1dEY1g-sLAHaITLsgyw8O2iF4XYhuvJSdBc14M9eGPF66yRfav6kLEtAIpgUfhOyz_lErhpncEnJqVrSM_8HKK22pc-38dj_Mn3vbc75qUMR_xeZFi41K6InFoqTN4EoxOLMsUpYGKqFmY6tVnFnbzd2XjVtD_ybwyB5225TC68w7rn7K57WtZdv7mgy0ygn69qEohYJpGe63LKFl_GdYRe0syhZleEFq35iHBEprXK7CyXjs0O_ar--7RTlAXIKGn8feoRg_5xg6boBnEQAefOjnXnqQevJPJkH70maGzFvKYwU8ExqHzajQKPmzzuqWv6ZgbAsIgP8t5Ar8-7CMqmdjEnA2HKK_s_AaioYagY5QRCbmhTquPU"
    

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

//
//  Alert.swift
//  Starling Savings
//
//  Created by Edward on 10/02/2020.
//  Copyright © 2020 Edward Theodor Danescu. All rights reserved.
//

import Foundation
import SPAlert

struct Alert {
    
    static func genericError() {
        SPAlert.present(title: "Error", message: "Something went wrong. Please try again later.", preset: .error)
    }
    
    static func done() {
        SPAlert.present(title: "Done", preset: .done)
    }
    
}

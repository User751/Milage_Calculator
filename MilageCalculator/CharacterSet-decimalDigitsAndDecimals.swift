//
//  CharacterSet-decimalDigitsAndDecimals.swift
//  MilageCalculator
//
//  Created by Sina Yeganeh on 3/12/19.
//  Copyright © 2019 Will Laxson. All rights reserved.
//

import Foundation

extension CharacterSet {
    // Extending character set in order to provide decimals too
    
    static var decimalDigitsAndDecimals: CharacterSet {
        get {
            var decimalDigitsAndDecimal = CharacterSet.decimalDigits
            decimalDigitsAndDecimal.insert(charactersIn: ".")
            return decimalDigitsAndDecimal
        }
        
    }
}

//
//  Log.swift
//  MilageCalculator
//
//  Created by Sina Yeganeh on 3/11/19.
//  Copyright © 2019 Will Laxson. All rights reserved.
//

import Foundation

struct Log {
    let date: Date
    let miles: Double
    let gallons: Double
    
    static func loadAllLogs() -> [Log] {
        
        return [] // Temp
    }
    
    static func saveAllLogs(logs: [Log]) -> Bool {
        
        return true
    }
}



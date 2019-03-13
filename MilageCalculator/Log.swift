//
//  Log.swift
//  MilageCalculator
//
//  Created by Sina Yeganeh on 3/11/19.
//  Copyright © 2019 Will Laxson. All rights reserved.
//

import Foundation

struct Log: Codable, Equatable {
    static var key = "AllLogs"
    let date: Date
    let miles: Double
    let gallons: Double
    
    
    static func loadAllLogs() -> [Log] {
        let defaults = UserDefaults.standard
        
        guard let allLogs = defaults.object(forKey: Log.key) as? [Data] else {
            fatalError("Could not load logs")
        }
        var decodedLogs = [Log]()
        let decoder = JSONDecoder()
        
        for log in allLogs {
            if let loadedData = try? decoder.decode(Log.self, from: log) {
                decodedLogs.append(loadedData)
                
            }
        }
        return decodedLogs
    }
    
    
    static func saveAllLogs(logs decodedLogs: [Log]) -> Bool {
        
        let encoder = JSONEncoder()
        var encodedLogsArray = [Data]()
        let defaults = UserDefaults.standard
        
        for log in decodedLogs {
            if let encodededLog = try? encoder.encode(log) {
               encodedLogsArray.append(encodededLog)
            }
        }
        
        defaults.set(encodedLogsArray, forKey: Log.key)
        
        return true
        
    }
    
}



//
//  Log.swift
//  MilageCalculator
//
//  Created by Sina Yeganeh on 3/11/19.
//  Copyright © 2019 Will Laxson. All rights reserved.
//

import Foundation

struct Log: Codable, Equatable {
    let date: Date
    let miles: Double
    let gallons: Double
    
    
    static func loadAllLogs(with key: String = "AllLogs") -> [Log] {
        let defaults = UserDefaults.standard
        
        guard let allLogs = defaults.object(forKey: key) as? [Data] else {
            print("No data detected, initializing new data")
            let initialData = [Data]()
            defaults.set(initialData, forKey: key)
            return []
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
    
    
    static func saveAllLogs(logs decodedLogs: [Log], with key: String = "AllLogs") -> Bool {
        
        let encoder = JSONEncoder()
        var encodedLogsArray = [Data]()
        let defaults = UserDefaults.standard
        
        for log in decodedLogs {
            if let encodededLog = try? encoder.encode(log) {
               encodedLogsArray.append(encodededLog)
            }
        }
        
        defaults.set(encodedLogsArray, forKey: key)
        
        return true
        
    }
    
}

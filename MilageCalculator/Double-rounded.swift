//
//  Double-rounded.swift
//  MilageCalculator
//
//  Created by Will Laxson on 3/12/19.
//  Copyright © 2019 Will Laxson. All rights reserved.
//

import Foundation

extension Double {
    func rounded(to place: Int) -> Double {
        if (place <= 0) {
            return self.rounded()
        }
        let muliplier = pow(10.0, Double(place))
        let num = self * muliplier
        // 5.3716423
        
        let roundedNumber = num.rounded() / muliplier
        
        return roundedNumber
        
    }
}

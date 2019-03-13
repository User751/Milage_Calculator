//
//  MilageCalculatorTests.swift
//  MilageCalculatorTests
//
//  Created by Will Laxson on 3/12/19.
//  Copyright © 2019 Will Laxson. All rights reserved.
//

import XCTest
@testable import MilageCalculator

class MilageCalculatorTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLogSavingAndLoading() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let log1 = Log(date: Date(), miles: 100.0, gallons: 5.0)
        let log2 = Log(date: Date() + 10, miles: 100.0, gallons: 4.0)
        let log3 = Log(date: Date() + 20, miles: 100.0, gallons: 5.5)
        
        let testLogs = [log1,log2,log3]
        
        _ = Log.saveAllLogs(logs: testLogs, with: "TestKey")
        
        let testLogs2 = Log.loadAllLogs(with: "TestKey")
        
        XCTAssert(testLogs == testLogs2)
        UserDefaults.standard.removeObject(forKey: "TestKey")
    }

}

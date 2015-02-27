//
//  RunsListerTests.swift
//  RunsListerTests
//
//  Created by Steve Baker on 2/26/15.
//  Copyright (c) 2015 Beepscore LLC. All rights reserved.
//

import UIKit
import XCTest
//import RunsLister

class RunsListerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func runsDescription(runs: [Run]) -> NSString {
        var description = ""

        for run in runs {
            description += run.description
        }
        return description
    }

    func testRuns() {
        let numbers = [1, -7, 2, 1, 3, 48, 0, 0, 4, 12, 14]
        let expected = [Run(startIndex: 1, stopIndex: 2),
            Run(startIndex: 3, stopIndex: 5),
            Run(startIndex: 7, stopIndex: 10)]
        let actual = RunsLister.runs(numbers)
        println("expected \(self.runsDescription(expected))")
        println("actual \(self.runsDescription(actual))")
        XCTAssertEqual(expected, actual,
            "Expected \(expected.description) but got actual \(actual.description)")
    }
    
    func testRunsNumbersEmpty() {
        let numbers: [Int] = []
        let expected: [Run] = []
        let actual = RunsLister.runs(numbers)
        XCTAssertEqual(expected, actual)
    }

    func testRunsNumbersLengthOne() {
        let numbers: [Int] = [3]
        let expected: [Run] = []
        let actual = RunsLister.runs(numbers)
        XCTAssertEqual(expected, actual)
    }

}

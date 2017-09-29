//
//  RunsListerTests.swift
//  RunsListerTests
//
//  Created by Steve Baker on 2/26/15.
//  Copyright (c) 2015 Beepscore LLC. All rights reserved.
//

import UIKit
import XCTest
@testable import RunsLister

class RunsListerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testisEndOfARun() {
        XCTAssertFalse(RunsLister.isEndOfARun(numbers: [2], index: 0))
        XCTAssertFalse(RunsLister.isEndOfARun(numbers: [2, 2], index: 0))
        XCTAssertFalse(RunsLister.isEndOfARun(numbers: [2, 2], index: 1))

        XCTAssertFalse(RunsLister.isEndOfARun(numbers: [3, 5], index: 0))
        XCTAssertTrue(RunsLister.isEndOfARun(numbers: [3, 5], index: 1))

        let numbers = [1, -7, 2, 1, 3, 48, 0, 0, 4, 12, 14]
        XCTAssertTrue(RunsLister.isEndOfARun(numbers: numbers, index: 2))
        XCTAssertTrue(RunsLister.isEndOfARun(numbers: numbers, index: 5))
        XCTAssertTrue(RunsLister.isEndOfARun(numbers: numbers, index: 10))
        XCTAssertFalse(RunsLister.isEndOfARun(numbers: numbers, index: 0))
        XCTAssertFalse(RunsLister.isEndOfARun(numbers: numbers, index: 1))
        XCTAssertFalse(RunsLister.isEndOfARun(numbers: numbers, index: 3))
        XCTAssertFalse(RunsLister.isEndOfARun(numbers: numbers, index: 4))
        XCTAssertFalse(RunsLister.isEndOfARun(numbers: numbers, index: 6))
        XCTAssertFalse(RunsLister.isEndOfARun(numbers: numbers, index: 7))
        XCTAssertFalse(RunsLister.isEndOfARun(numbers: numbers, index: 8))
        XCTAssertFalse(RunsLister.isEndOfARun(numbers: numbers, index: 9))
    }

    func testisStartOfARun() {
        XCTAssertFalse(RunsLister.isStartOfARun(numbers: [2], index: 0))
        XCTAssertFalse(RunsLister.isStartOfARun(numbers: [2, 2], index: 0))
        XCTAssertFalse(RunsLister.isStartOfARun(numbers: [2, 2], index: 1))

        XCTAssertTrue(RunsLister.isStartOfARun(numbers: [3, 5], index: 0))
        XCTAssertFalse(RunsLister.isStartOfARun(numbers: [3, 5], index: 1))

        let numbers = [1, -7, 2, 1, 3, 48, 0, 0, 4, 12, 14]
        XCTAssertTrue(RunsLister.isStartOfARun(numbers: numbers, index: 1))
        XCTAssertTrue(RunsLister.isStartOfARun(numbers: numbers, index: 3))
        XCTAssertTrue(RunsLister.isStartOfARun(numbers: numbers, index: 7))
        XCTAssertFalse(RunsLister.isStartOfARun(numbers: numbers, index: 0))
        XCTAssertFalse(RunsLister.isStartOfARun(numbers: numbers, index: 2))
        XCTAssertFalse(RunsLister.isStartOfARun(numbers: numbers, index: 4))
        XCTAssertFalse(RunsLister.isStartOfARun(numbers: numbers, index: 5))
        XCTAssertFalse(RunsLister.isStartOfARun(numbers: numbers, index: 6))
        XCTAssertFalse(RunsLister.isStartOfARun(numbers: numbers, index: 8))
        XCTAssertFalse(RunsLister.isStartOfARun(numbers: numbers, index: 9))
        XCTAssertFalse(RunsLister.isStartOfARun(numbers: numbers, index: 10))
    }

    // MARK: Test listRuns

    func testListRuns() {
        let numbers = [1, -7, 2, 1, 3, 48, 0, 0, 4, 12, 14]
        let expectedRunList = [Run(startIndex: 1, stopIndex: 2),
            Run(startIndex: 3, stopIndex: 5),
            Run(startIndex: 7, stopIndex: 10)]
        let expected = Runs(list: expectedRunList)
        let actual = RunsLister.listRuns(numbers: numbers)
        XCTAssertEqual(expected, actual,
            "Expected \n \(expected.description) but got actual \n \(actual.description)")
    }

    func testListRunsNumbersEmpty() {
        let numbers: [Int] = []
        let expectedRunList: [Run] = []
        let expected = Runs(list: expectedRunList)
        let actual = RunsLister.listRuns(numbers: numbers)
        XCTAssertEqual(expected, actual,
            "Expected \n \(expected.description) but got actual \n \(actual.description)")
    }

    func testListRunsNumbersLengthOne() {
        let numbers: [Int] = [3]
        let expectedRunList: [Run] = []
        let expected = Runs(list: expectedRunList)
        let actual = RunsLister.listRuns(numbers: numbers)
        XCTAssertEqual(expected, actual,
            "Expected \n \(expected.description) but got actual \n \(actual.description)")
    }

    // MARK: Test listRuns2

    func testListRuns2() {
        let numbers = [1, -7, 2, 1, 3, 48, 0, 0, 4, 12, 14]
        let expectedRunList = [Run(startIndex: 1, stopIndex: 2),
            Run(startIndex: 3, stopIndex: 5),
            Run(startIndex: 7, stopIndex: 10)]
        let expected = Runs(list: expectedRunList)
        let actual = RunsLister.listRuns2(numbers: numbers)
        XCTAssertEqual(expected, actual,
            "Expected \n \(expected.description) but got actual \n \(actual.description)")
    }

    func testListRuns2NumbersEmpty() {
        let numbers: [Int] = []
        let expectedRunList: [Run] = []
        let expected = Runs(list: expectedRunList)
        let actual = RunsLister.listRuns2(numbers: numbers)
        XCTAssertEqual(expected, actual,
            "Expected \n \(expected.description) but got actual \n \(actual.description)")
    }

    func testListRuns2NumbersLengthOne() {
        let numbers: [Int] = [3]
        let expectedRunList: [Run] = []
        let expected = Runs(list: expectedRunList)
        let actual = RunsLister.listRuns2(numbers: numbers)
        XCTAssertEqual(expected, actual,
            "Expected \n \(expected.description) but got actual \n \(actual.description)")
    }

    func testListRuns2NumbersLengthTwoEqual() {
        let numbers: [Int] = [3, 3]
        let expectedRunList: [Run] = []
        let expected = Runs(list: expectedRunList)
        let actual = RunsLister.listRuns2(numbers: numbers)
        XCTAssertEqual(expected, actual,
            "Expected \n \(expected.description) but got actual \n \(actual.description)")
    }

    func testListRuns2NumbersStartsOnARun() {
        let numbers: [Int] = [1, 3, 0]
        let expectedRunList = [Run(startIndex: 0, stopIndex: 1)]
        let expected = Runs(list: expectedRunList)
        let actual = RunsLister.listRuns2(numbers: numbers)
        XCTAssertEqual(expected, actual,
            "Expected \n \(expected.description) but got actual \n \(actual.description)")
    }

    func testListRuns2NumbersOneRun() {
        let numbers: [Int] = [2, 8, 42]
        let expectedRunList = [Run(startIndex: 0, stopIndex: 2)]
        let expected = Runs(list: expectedRunList)
        let actual = RunsLister.listRuns2(numbers: numbers)
        XCTAssertEqual(expected, actual,
            "Expected \n \(expected.description) but got actual \n \(actual.description)")
    }

    func testListRuns2NumbersEndOnARun() {
        let numbers: [Int] = [7, 3, 4]
        let expectedRunList = [Run(startIndex: 1, stopIndex: 2)]
        let expected = Runs(list: expectedRunList)
        let actual = RunsLister.listRuns2(numbers: numbers)
        XCTAssertEqual(expected, actual,
            "Expected \n \(expected.description) but got actual \n \(actual.description)")
    }

}

//
//  SortedListRunCounterTests.swift
//  RunsListerTests
//
//  Created by Steve Baker on 9/28/17.
//  Copyright © 2017 Beepscore LLC. All rights reserved.
//

import XCTest
@testable import RunsLister

class SortedListRunCounterTests: XCTestCase {

    func testRunCountEmpty() {
        XCTAssertEqual(SortedListRunCounter.runCount(intsSortedAscending: [], value: 4), 0)
    }

    func testRunCountList1NotFound() {
        XCTAssertEqual(SortedListRunCounter.runCount(intsSortedAscending: [3], value: 4), 0)
    }

    func testRunCountNotFound() {
        XCTAssertEqual(SortedListRunCounter.runCount(intsSortedAscending: [1, 3, 5], value: 4), 0)
    }

    func testRunCountList1() {
        XCTAssertEqual(SortedListRunCounter.runCount(intsSortedAscending: [3], value: 3), 1so)
    }

    func testRunCount1() {
        XCTAssertEqual(SortedListRunCounter.runCount(intsSortedAscending: [1, 3, 4, 5], value: 4), 1)
    }

    func testRunCountRunAtBeginning1() {
        XCTAssertEqual(SortedListRunCounter.runCount(intsSortedAscending: [2, 3, 4, 5], value: 2), 1)
    }

    func testRunCountRunAtBeginning() {
        XCTAssertEqual(SortedListRunCounter.runCount(intsSortedAscending: [2, 2, 2, 2, 3, 3, 4, 5], value: 2), 4)
    }

    func testRunCountRunAtEnd1() {
        XCTAssertEqual(SortedListRunCounter.runCount(intsSortedAscending: [2, 3, 8], value: 8), 1)
    }

    func testRunCountRunAtEnd() {
        XCTAssertEqual(SortedListRunCounter.runCount(intsSortedAscending: [2, 2, 2, 2, 3, 3, 4, 5, 5, 5], value: 5), 3)
    }

    func testRunCountRunInMiddle1() {
        XCTAssertEqual(SortedListRunCounter.runCount(intsSortedAscending: [2, 2, 2, 2, 3, 3, 4, 5, 5, 5], value: 4), 1)
    }

    func testRunCountRunInMiddle() {
        XCTAssertEqual(SortedListRunCounter.runCount(intsSortedAscending: [2, 2, 2, 2, 3, 3, 4, 5, 5, 5], value: 3), 2)
    }
}

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

    func testRunCountNotFound() {
        XCTAssertEqual(SortedListRunCounter.runCount(intsSortedAscending: [1, 3, 5], value: 4), 0)
    }

    func testRunCount1() {
        XCTAssertEqual(SortedListRunCounter.runCount(intsSortedAscending: [1, 3, 4, 5], value: 4), 1)
    }
}

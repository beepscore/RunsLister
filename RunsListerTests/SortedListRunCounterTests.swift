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

}

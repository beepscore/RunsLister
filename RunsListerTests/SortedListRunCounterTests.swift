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

    // MARK: - test runCount

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
        XCTAssertEqual(SortedListRunCounter.runCount(intsSortedAscending: [3], value: 3), 1)
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

    func testRunCountSpecificationExample() {
        let intsSortedAscending = [1, 2, 3, 4, 4, 5, 5, 5, 8, 10]

        XCTAssertEqual(SortedListRunCounter.runCount(intsSortedAscending: intsSortedAscending, value: 1), 1)
        XCTAssertEqual(SortedListRunCounter.runCount(intsSortedAscending: intsSortedAscending, value: 4), 2)
        XCTAssertEqual(SortedListRunCounter.runCount(intsSortedAscending: intsSortedAscending, value: 5), 3)
    }

    // MARK: - test runCountBinarySearch

    func testRunCountBinarySearchEmpty() {
        XCTAssertEqual(SortedListRunCounter.runCountBinarySearch(intsSortedAscending: [], value: 4), 0)
    }

    func testRunCountBinarySearchList1NotFound() {
        XCTAssertEqual(SortedListRunCounter.runCountBinarySearch(intsSortedAscending: [3], value: 4), 0)
    }

    func testRunCountBinarySearchNotFound() {
        XCTAssertEqual(SortedListRunCounter.runCountBinarySearch(intsSortedAscending: [1, 3, 5], value: 4), 0)
    }

    func testRunCountBinarySearchList1() {
        XCTAssertEqual(SortedListRunCounter.runCountBinarySearch(intsSortedAscending: [3], value: 3), 1)
    }

    func testRunCountBinarySearch1() {
        XCTAssertEqual(SortedListRunCounter.runCountBinarySearch(intsSortedAscending: [1, 3, 4, 5], value: 4), 1)
    }

    func testRunCountBinarySearchRunAtBeginning1() {
        XCTAssertEqual(SortedListRunCounter.runCountBinarySearch(intsSortedAscending: [2, 3, 4, 5], value: 2), 1)
    }

    func testRunCountBinarySearchRunAtBeginning() {
        XCTAssertEqual(SortedListRunCounter.runCountBinarySearch(intsSortedAscending: [2, 2, 2, 2, 3, 3, 4, 5], value: 2), 4)
    }

    func testRunCountBinarySearchRunAtEnd1() {
        XCTAssertEqual(SortedListRunCounter.runCountBinarySearch(intsSortedAscending: [2, 3, 8], value: 8), 1)
    }

    func testRunCountBinarySearchRunAtEnd() {
        XCTAssertEqual(SortedListRunCounter.runCountBinarySearch(intsSortedAscending: [2, 2, 2, 2, 3, 3, 4, 5, 5, 5], value: 5), 3)
    }

    func testRunCountBinarySearchRunInMiddle1() {
        XCTAssertEqual(SortedListRunCounter.runCountBinarySearch(intsSortedAscending: [2, 2, 2, 2, 3, 3, 4, 5, 5, 5], value: 4), 1)
    }

    func testRunCountBinarySearchRunInMiddle() {
        XCTAssertEqual(SortedListRunCounter.runCountBinarySearch(intsSortedAscending: [2, 2, 2, 2, 3, 3, 4, 5, 5, 5], value: 3), 2)
    }

    func testRunCountBinarySearchSpecificationExample() {
        let intsSortedAscending = [1, 2, 3, 4, 4, 5, 5, 5, 8, 10]

        XCTAssertEqual(SortedListRunCounter.runCountBinarySearch(intsSortedAscending: intsSortedAscending, value: 1), 1)
        XCTAssertEqual(SortedListRunCounter.runCountBinarySearch(intsSortedAscending: intsSortedAscending, value: 4), 2)
        XCTAssertEqual(SortedListRunCounter.runCountBinarySearch(intsSortedAscending: intsSortedAscending, value: 5), 3)
    }

    // MARK: - test runStartBinarySearch
    
    func testRunStartBinarySearchEmpty() {
        XCTAssertEqual(SortedListRunCounter.runStartBinarySearch(intsSortedAscending: [], value: 4, range: 0...0), nil)
    }

    func testRunStartBinarySearchList1NotFound() {
        let intsSortedAscending = [3]
        XCTAssertEqual(SortedListRunCounter.runStartBinarySearch(intsSortedAscending: intsSortedAscending, value: 4, range: 0...intsSortedAscending.count - 1), nil)
    }

    func testRunStartBinarySearchListNotFound() {
        let intsSortedAscending = [1, 3, 5]
        XCTAssertEqual(SortedListRunCounter.runStartBinarySearch(intsSortedAscending: intsSortedAscending, value: 4, range: 0...intsSortedAscending.count - 1), nil)
    }

    func testRunStartList1() {
        let intsSortedAscending = [3]
        XCTAssertEqual(SortedListRunCounter.runStartBinarySearch(intsSortedAscending: intsSortedAscending, value: 3, range: 0...intsSortedAscending.count - 1), 0)
    }

    func testRunStart1() {
        let intsSortedAscending = [1, 3, 4, 5]
        XCTAssertEqual(SortedListRunCounter.runStartBinarySearch(intsSortedAscending: intsSortedAscending, value: 4, range: 0...intsSortedAscending.count - 1), 2)
    }

    func testRunStartRunAtBeginning1() {
        let intsSortedAscending = [2, 3, 4, 5]
        XCTAssertEqual(SortedListRunCounter.runStartBinarySearch(intsSortedAscending: intsSortedAscending, value: 2, range: 0...intsSortedAscending.count - 1), 0)
    }

    func testRunStartRunAtBeginning() {
        let intsSortedAscending = [2, 2, 2, 2, 3, 3, 4, 5]
        XCTAssertEqual(SortedListRunCounter.runStartBinarySearch(intsSortedAscending: intsSortedAscending, value: 2, range: 0...intsSortedAscending.count - 1), 0)
    }

    func testRunStartRunAtEnd1() {
        let intsSortedAscending = [2, 3, 8]
        XCTAssertEqual(SortedListRunCounter.runStartBinarySearch(intsSortedAscending: intsSortedAscending, value: 8, range: 0...intsSortedAscending.count - 1), 2)
    }

    func testRunStartRunAtEnd() {
        let intsSortedAscending = [2, 2, 2, 2, 3, 3, 4, 5, 5, 5]
        XCTAssertEqual(SortedListRunCounter.runStartBinarySearch(intsSortedAscending: intsSortedAscending, value: 5, range: 0...intsSortedAscending.count - 1), 7)
    }

    func testRunStartRunInMiddle1() {
        let intsSortedAscending = [2, 2, 2, 2, 3, 3, 4, 5, 5, 5]
        XCTAssertEqual(SortedListRunCounter.runStartBinarySearch(intsSortedAscending: intsSortedAscending, value: 4, range: 0...intsSortedAscending.count - 1), 6)
    }

    func testRunStartRunInMiddle() {
        let intsSortedAscending = [2, 2, 2, 2, 3, 3, 4, 5, 5, 5]
        XCTAssertEqual(SortedListRunCounter.runStartBinarySearch(intsSortedAscending: intsSortedAscending, value: 3, range: 0...intsSortedAscending.count - 1), 4)
    }

    func testRunStartBinarySearchSpecificationExample() {
        let intsSortedAscending = [1, 2, 3, 4, 4, 5, 5, 5, 8, 10]

        XCTAssertEqual(SortedListRunCounter.runStartBinarySearch(intsSortedAscending: intsSortedAscending, value: 1, range: 0...intsSortedAscending.count - 1), 0)
        XCTAssertEqual(SortedListRunCounter.runStartBinarySearch(intsSortedAscending: intsSortedAscending, value: 4, range: 0...intsSortedAscending.count - 1), 3)
        XCTAssertEqual(SortedListRunCounter.runStartBinarySearch(intsSortedAscending: intsSortedAscending, value: 5, range: 0...intsSortedAscending.count - 1), 5)
    }

    // MARK: - test runEndBinarySearch
    
    func testRunEndBinarySearchEmpty() {
        XCTAssertEqual(SortedListRunCounter.runEndBinarySearch(intsSortedAscending: [], value: 4, range: 0...0), nil)
    }

    func testRunEndBinarySearchList1NotFound() {
        let intsSortedAscending = [3]
        XCTAssertEqual(SortedListRunCounter.runEndBinarySearch(intsSortedAscending: intsSortedAscending, value: 4, range: 0...intsSortedAscending.count - 1), nil)
    }

    func testRunEndBinarySearchListNotFound() {
        let intsSortedAscending = [1, 3, 5]
        XCTAssertEqual(SortedListRunCounter.runEndBinarySearch(intsSortedAscending: intsSortedAscending, value: 4, range: 0...intsSortedAscending.count - 1), nil)
    }

    func testRunEndBinarySearchList1() {
        let intsSortedAscending = [3]
        XCTAssertEqual(SortedListRunCounter.runEndBinarySearch(intsSortedAscending: intsSortedAscending, value: 3, range: 0...intsSortedAscending.count - 1), 0)
    }

    func testRunEndBinarySearch1() {
        let intsSortedAscending = [1, 3, 4, 5]
        XCTAssertEqual(SortedListRunCounter.runEndBinarySearch(intsSortedAscending: intsSortedAscending, value: 4, range: 0...intsSortedAscending.count - 1), 2)
    }

    func testRunEndBinarySearchRunAtBeginning1() {
        let intsSortedAscending = [2, 3, 4, 5]
        XCTAssertEqual(SortedListRunCounter.runEndBinarySearch(intsSortedAscending: intsSortedAscending, value: 2, range: 0...intsSortedAscending.count - 1), 0)
    }

    func testRunEndBinarySearchRunAtBeginning() {
        let intsSortedAscending = [2, 2, 2, 2, 3, 3, 4, 5]
        XCTAssertEqual(SortedListRunCounter.runEndBinarySearch(intsSortedAscending: intsSortedAscending, value: 2, range: 0...intsSortedAscending.count - 1), 3)
    }

    func testRunEndBinarySearchRunAtEnd1() {
        let intsSortedAscending = [2, 3, 8]
        XCTAssertEqual(SortedListRunCounter.runEndBinarySearch(intsSortedAscending: intsSortedAscending, value: 8, range: 0...intsSortedAscending.count - 1), 2)
    }

    func testRunEndBinarySearchRunAtEnd() {
        let intsSortedAscending = [2, 2, 2, 2, 3, 3, 4, 5, 5, 5]
        XCTAssertEqual(SortedListRunCounter.runEndBinarySearch(intsSortedAscending: intsSortedAscending, value: 5, range: 0...intsSortedAscending.count - 1), 9)
    }

    func testRunEndBinarySearchRunInMiddle1() {
        let intsSortedAscending = [2, 2, 2, 2, 3, 3, 4, 5, 5, 5]
        XCTAssertEqual(SortedListRunCounter.runEndBinarySearch(intsSortedAscending: intsSortedAscending, value: 4, range: 0...intsSortedAscending.count - 1), 6)
    }

    func testRunEndBinarySearchRunInMiddle() {
        let intsSortedAscending = [2, 2, 2, 2, 3, 3, 4, 5, 5, 5]
        XCTAssertEqual(SortedListRunCounter.runEndBinarySearch(intsSortedAscending: intsSortedAscending, value: 3, range: 0...intsSortedAscending.count - 1), 5)
    }

    func testRunEndBinarySearchSpecificationExample() {
        let intsSortedAscending = [1, 2, 3, 4, 4, 5, 5, 5, 8, 10]

        XCTAssertEqual(SortedListRunCounter.runEndBinarySearch(intsSortedAscending: intsSortedAscending, value: 1, range: 0...intsSortedAscending.count - 1), 0)
        XCTAssertEqual(SortedListRunCounter.runEndBinarySearch(intsSortedAscending: intsSortedAscending, value: 4, range: 0...intsSortedAscending.count - 1), 4)
        XCTAssertEqual(SortedListRunCounter.runEndBinarySearch(intsSortedAscending: intsSortedAscending, value: 5, range: 0...intsSortedAscending.count - 1), 7)
    }
}

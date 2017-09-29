//
//  SortedListRunCounter.swift
//  RunsLister
//
//  Created by Steve Baker on 9/28/17.
//  Copyright © 2017 Beepscore LLC. All rights reserved.
//

import Foundation

class SortedListRunCounter {

    // MARK: runCount

    /// - Parameters:
    ///   - intsSortedAscending: a list of integers sorted in increasing order
    ///   - value: the integer to search for
    /// - Returns: the count of occurrences of value. Returns 0 if not found.
    class func runCount(intsSortedAscending: [Int], value: Int) -> Int {

        guard let startIndex = intsSortedAscending.index(of: value) else {
            // value not in list
            return 0
        }

        // reversed() is lazy, returns an 'ReversedRandomAccessIndex<[Int]>' iterator
        // that can't be used directly in integer arithmetic
        // instantiate a new array
        let intsSortedDescending = Array(intsSortedAscending.reversed())

        guard let reversedStartIndex = intsSortedDescending.index(of: value) else {
            return 0
        }

        let endIndex = (intsSortedAscending.count - 1) - reversedStartIndex
        return (endIndex - startIndex) + 1
    }

    // MARK: runCountBinarySearch

    /// - Parameters:
    ///   - intsSortedAscending: a list of integers sorted in increasing order
    ///   - value: the integer to search for
    /// - Returns: the count of occurrences of value. Returns 0 if not found.
    class func runCountBinarySearch(intsSortedAscending: [Int], value: Int) -> Int {
        return 0
    }

    /// Uses a binary search. This makes use of the fact that the list is sorted ascending.
    /// Probably more efficient than index(of:), which is built for general case unsorted.
    ///
    /// - Parameters:
    ///   - intsSortedAscending: a list of integers sorted in increasing order
    ///   - value: the integer to search for
    ///   - range: the range to search, a sublist
    /// - Returns: the index of the first occurence of the value in range. Returns None if not found
    class func runStartBinarySearch(intsSortedAscending: [Int],
                                    value: Int,
                                    range: CountableClosedRange<Int>) -> Int? {

        // edge case empty list
        if intsSortedAscending.count == 0 {
            return nil
        }

        if intsSortedAscending[range.lowerBound] > value || intsSortedAscending[range.upperBound] < value {
            // value is not in range
            return nil
        }

        if intsSortedAscending[range.lowerBound] == value {
            // runStart is at range.lowerBound or not in range
            if range.lowerBound == 0 {
                // avoid out of range error don't check range.lowerBound - 1
                return 0
            } else if intsSortedAscending[range.lowerBound - 1] < value {
                return range.lowerBound
            } else {
                // runStart is not in range
                return nil
            }
        }

        if intsSortedAscending[range.lowerBound] < value {
            // runStart is within range or nil

            // edge case if count is 2 don't try to get a subrange
            if range.count == 2 {
                if intsSortedAscending[range.upperBound] == value {
                    return range.upperBound
                } else {
                    return nil
                }
            }

            // choose a subrange and recurse
            let midIndex = range.lowerBound + Int((range.upperBound - range.lowerBound) / 2)

            if intsSortedAscending[midIndex] >= value {
                // recurse on head
                return runStartBinarySearch(intsSortedAscending: intsSortedAscending, value: value, range: range.lowerBound...midIndex)
            } else {
                // recurse on tail
                return runStartBinarySearch(intsSortedAscending: intsSortedAscending, value: value, range: midIndex...range.upperBound)
            }
        }

        // defensive programming, execution shouldn't get here
        return nil
    }
}

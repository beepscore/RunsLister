//
//  SortedListRunCounter.swift
//  RunsLister
//
//  Created by Steve Baker on 9/28/17.
//  Copyright © 2017 Beepscore LLC. All rights reserved.
//

import Foundation

class SortedListRunCounter {

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
        // make a new array
        let intsSortedDescending = Array(intsSortedAscending.reversed())

        guard let reversedStartIndex = intsSortedDescending.index(of: value) else {
            return 0
        }

        let endIndex = (intsSortedAscending.count - 1) - reversedStartIndex
        return (endIndex - startIndex) + 1
    }

}

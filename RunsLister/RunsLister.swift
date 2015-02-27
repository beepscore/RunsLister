//
//  RunsLister.swift
//  RunsLister
//
//  Created by Steve Baker on 2/26/15.
//  Copyright (c) 2015 Beepscore LLC. All rights reserved.
//

import Foundation

class RunsLister {

    // keyword "class" declares a type method, similar to a class method
    class func listRuns(numbers: [Int]) -> Runs {

        if (numbers.count < 2) {
            // array with no elements or 1 element can't contain a run
            return Runs(list: [])
        }

        // [1, -7, 2, 1, 3, 48, 0, 0, 4, 12, 14]
        var runList: [Run] = []
        var runs = Runs(list:runList)
        var startIndex = 0
        var stopIndex = 0

        for (var index = 1; index < numbers.count; index++) {
            if numbers[index] <= numbers[index-1] {
                // we aren't in a run
                stopIndex = index - 1
                if (stopIndex > startIndex) {
                    runs.list.append(Run(startIndex: startIndex, stopIndex: stopIndex))
                }
                startIndex = index
            } else {
                // we are in a run
                if (numbers.count - 1) == index {
                    // we are at last element in array
                    stopIndex = index
                    runs.list.append(Run(startIndex: startIndex, stopIndex: stopIndex))
                }
            }
        }
        
        return runs
    }
}

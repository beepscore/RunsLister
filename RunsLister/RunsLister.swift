//
//  RunsLister.swift
//  RunsLister
//
//  Created by Steve Baker on 2/26/15.
//  Copyright (c) 2015 Beepscore LLC. All rights reserved.
//

import Foundation

class RunsLister {

    class func isEndOfARun(numbers: [Int], index: Int) -> Bool {

        if index < 1 {
            // element zero can't be end of a run
            return false
        }
        
        if ((numbers[index] > numbers[index - 1])
            && ((numbers.count - 1 == index)
                || (numbers[index] >= numbers[index + 1]))) {
                    return true
        } else {
            return false
        }
    }

    class func isStartOfARun(numbers: [Int], index: Int) -> Bool {

        if numbers.count - 1 == index {
            // last element can't be start of a run
            return false
        }
        
        if ((numbers[index] < numbers[index + 1])
            && ((0 == index)
                || (numbers[index] <= numbers[index - 1]))) {
                    return true
        } else {
            return false
        }
    }
    
    // keyword "class" declares a type method, similar to a class method
    class func listRuns(numbers: [Int]) -> Runs {

        if (numbers.count < 2) {
            // array with no elements or 1 element can't contain a run
            return Runs(list: [])
        }

        let runList: [Run] = []
        let runs = Runs(list:runList)
        var startIndex = 0
        var stopIndex = 0

        for (index, number) in numbers.enumerated() {

            // skip 0, it can't be end of a run
            if index == 0 { continue }

            if number <= numbers[index-1] {
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

    /** 
    This method is similar to listRuns
    It is designed to be easier to write and read than listRuns.
    It uses functions isStartOfRun and isEndOfRun.
    Probably it is less efficient than listRuns because it may do more comparisons.
    */
    class func listRuns2(numbers: [Int]) -> Runs {

        let runList: [Run] = []
        let runs = Runs(list:runList)
        var startIndex = 0

        for (index, _) in numbers.enumerated() {

            // skip 0, it can't be end of a run
            if index == 0 { continue }

            if RunsLister.isStartOfARun(numbers: numbers, index: index) {
                startIndex = index
            }
            if RunsLister.isEndOfARun(numbers: numbers, index: index) {
                runs.list.append(Run(startIndex: startIndex, stopIndex: index))
            }
        }
        return runs
    }

}

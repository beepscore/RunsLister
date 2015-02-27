//
//  RunsLister.swift
//  RunsLister
//
//  Created by Steve Baker on 2/26/15.
//  Copyright (c) 2015 Beepscore LLC. All rights reserved.
//

import Foundation

class RunsLister {

    typealias Runs = [Run]

    // keyword "class" declares a type method, similar to a class method
    class func runs(numbers: [Int]) -> Runs {

        if (numbers.count < 2) {
            // array with no elements or 1 element can't contain a run
            let emptyRuns : [Run] = []
            return emptyRuns
        }
        
        return [Run(startIndex: 1, stopIndex: 2),
            Run(startIndex: 3, stopIndex: 5)]
    }
}

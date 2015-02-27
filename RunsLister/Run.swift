//
//  Run.swift
//  RunsLister
//
//  Created by Steve Baker on 2/26/15.
//  Copyright (c) 2015 Beepscore LLC. All rights reserved.
//

import Foundation

class Run : Equatable {

    var startIndex: Int
    var stopIndex: Int

    init(startIndex: Int, stopIndex: Int) {
        self.startIndex = startIndex
        self.stopIndex = stopIndex
    }

}

// function scope to compare two Run must be outside class Run
func == (lhs: Run, rhs: Run) -> Bool {
    return ((lhs.startIndex == rhs.startIndex)
        && (lhs.stopIndex == rhs.stopIndex))
}

func != (lhs: Run, rhs: Run) -> Bool {
    return ((lhs.startIndex != rhs.startIndex)
        || (lhs.stopIndex != rhs.stopIndex))
}

//
//  Runs.swift
//  RunsLister
//
//  Created by Steve Baker on 2/27/15.
//  Copyright (c) 2015 Beepscore LLC. All rights reserved.
//

import Foundation

// Runs class uses composition to contain array of runs [Run]
// Swift class can't subclass array, because array is a struct, not a class.
// i.e. can't do this- 
// class Runs : [Run] {

// iOS 9.0 API diffs
// removed Printable, DebugPrintable
// https://developer.apple.com/library/content/releasenotes/General/iOS90APIDiffs/Swift/Swift.html
class Runs : Equatable {
    var list: [Run] = []

    init(list: [Run]) {
        self.list = list
    }

    var description : String {
        var descriptionString = "["

        for run in self.list {
            descriptionString += run.description
        }
        descriptionString += "]"
        return descriptionString
    }

    var debugDescription : String {
        return self.description
    }
}

// function scope to compare two Runs must be outside class Runs
func == (lhs: Runs, rhs: Runs) -> Bool {
    return lhs.list == rhs.list
}

func != (lhs: Runs, rhs: Runs) -> Bool {
    return lhs.list != rhs.list
}

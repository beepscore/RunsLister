//
//  Runs.swift
//  RunsLister
//
//  Created by Steve Baker on 2/27/15.
//  Copyright (c) 2015 Beepscore LLC. All rights reserved.
//

import Foundation

// Swift array is a struct, not a class
// Runs can't subclass array
// class Runs : [Run] {

class Runs : Equatable, Printable, DebugPrintable {
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

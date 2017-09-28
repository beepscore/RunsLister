# Purpose
Write methods for handling runs of numbers in an array.

# Results

## Problem 1
Given an array of integers, return an array of the ascending runs.

### Background
Each run contains the start and end index from the source array.
Run length is >= 2.
Runs do not overlap.
Within a run, successive number must be greater than previous,
not greater than or equal to previous.

### Example

    source = [1, -7, 2, 1, 3, 48, 0, 0, 4, 12, 14]
    runs = [(1, 2), (3, 5), (7, 10)]

A Run can be a type that can hold two values such as a point, tuple, array.
A Run can be a class that can hold two values as properties such as startIndex, stopIndex.

### Tests
For more info see Run, Runs, RunsLister and tests.

## Problem 2
Given a list of integers sorted in increasing order, return the count of occurrences of an integer.

### Example

    numbers = [1, 2, 3, 4, 4, 5, 5, 5, 8, 10]

    f(1) returns 1
    f(4) returns 2
    f(5) returns 3

### Strategies
#### Dictionary
Could traverse they entire list, building a dictionary.
Then look for key in dictionary.
The list could possibly be huge.
This requires extra work, but makes subsequent calls fast.

#### Binary search
Could use binary search to find start of run, end of run.
For start of run, check number and previous number or beginning of list.
For end of run, check number and next number or end of list.
Then run length = (end index - start index) + 1

#### indexOf
I think Python has an indexOf method that returns the index of the first matching element. Maybe Swift does too.
To solve by writing very little code, could get startIndex via indexOf(number).
Get endIndex by reversing array, endIndex ~ array.count - reversed.indexOf(number). TODO: Check for off by 1 errors!



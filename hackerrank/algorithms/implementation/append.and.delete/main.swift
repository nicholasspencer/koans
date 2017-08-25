#!/usr/bin/swift

import Foundation

extension String {
  
  var length: Int {
    return self.characters.count
  }
  
  subscript (i: Int) -> String {
    return self[Range(i ..< i + 1)]
  }
  
  func substring(from: Int) -> String {
    return self[Range(min(from, length) ..< length)]
  }
  
  func substring(to: Int) -> String {
    return self[Range(0 ..< max(0, to))]
  }
  
  subscript (r: Range<Int>) -> String {
    let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                        upper: min(length, max(0, r.upperBound))))
    let start = index(startIndex, offsetBy: range.lowerBound)
    let end = index(start, offsetBy: range.upperBound - range.lowerBound)
    return self[Range(start ..< end)]
  }
  
  // -------------------------------------------------------------------------
  
  static func minimumLength(_ desired: String, _ initial: String) -> Int {
    return min(desired.length, initial.length)
  }
  
  static func maximumLength(_ desired: String, _ initial: String) -> Int {
    return max(desired.length, initial.length)
  }
  
  static func indexOfDifference(_ desired: String, _ initial: String) -> Int? {
    if desired == initial {
      return nil
    }
    
    let desiredLength = desired.length
    let initialLength = initial.length
    
    for index in 0 ..< String.minimumLength(desired, initial) {
      if desired[index] != initial[index] {
        return index
      }
    }
    
    if desiredLength < initialLength {
      return desiredLength
    }
    
    if initialLength < desiredLength {
      return initialLength
    }
    
    return nil
  }
  
  func lengthOfDifference(indexOfDifference: Int) -> Int {
    return self.substring(from: indexOfDifference).length
  }
  
  static func convertable(operationsNeeded: Int, operationsRequired: Int) -> Bool {
    let leftoverOperations = operationsRequired - operationsNeeded;
    
    if leftoverOperations < 0 {
      return false
    }
    
    if leftoverOperations % 2 == 0 {
      return true
    }
    
    return false
  }
  
  func convertable(desired: String, operationsRequired: Int) -> Bool {
//    let maximumLength = String.maximumLength(self, desired)
//    let minimumLength = String.minimumLength(self, desired)
    
    if operationsRequired > desired.length * 2 {
      return true
    }
    
    if let differenceIndex = String.indexOfDifference(self, desired) {
      let differenceCount = self.lengthOfDifference(indexOfDifference: differenceIndex)
                          + desired.lengthOfDifference(indexOfDifference: differenceIndex)
      
      return String.convertable(operationsNeeded: differenceCount, operationsRequired: operationsRequired)
    } else {
      return String.convertable(operationsNeeded: 0, operationsRequired: operationsRequired)
    }
  }
  
  func convertable(desired: String, operationsRequired: Int) -> String {
    return self.convertable(desired: desired, operationsRequired: operationsRequired) ? "Yes" : "No"
  }
  
}

let initialString = readLine()!
let desiredString = readLine()!
let operationCount: Int = Int(readLine()!)!

let result: String = initialString.convertable(desired: desiredString, operationsRequired: operationCount)

print(result)

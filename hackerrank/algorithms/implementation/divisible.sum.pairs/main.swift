#!/usr/bin/swift

import Foundation

extension String {
  var ints: [Int] {
    return self.components(separatedBy: String(" ")).map {
      return Int($0)!
    }
  }
}

extension Array where Iterator.Element == Int {
  func divisiblePairsCount(divisor: Int) -> Int {
    
    var buckets = Array(repeating: 0, count: divisor)
    var count = 0
    
    for value in self {
      let mod = value % divisor
      count += buckets[(divisor - mod) % divisor]
      buckets[mod] += 1
    }
    
    return count
    
  }
}

let divisor: Int = readLine()!.ints[1]
let ints = readLine()!.ints

print(ints.divisiblePairsCount(divisor: divisor))

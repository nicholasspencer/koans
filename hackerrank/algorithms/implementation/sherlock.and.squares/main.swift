#!/usr/bin/swift

import Foundation

extension String {
  var intComponents: [Int] {
    get {
      return self.components(separatedBy: String(" ")).map {
        return Int($0)!
      }
    }
  }
}

extension CountableClosedRange where Bound: Strideable  {
  var squaresCount: Int {
    get {
      if let first = self.first as! Int?, let last = self.last as! Int? {
        return Int(floor(sqrt(Double(last))) - ceil(sqrt(Double(first))) + 1)
      }
      
      return 0
    }
  }
}

let testCount: Int = Int(readLine()!)!

var tests: [CountableClosedRange<Int>] = []
for _ in 0..<testCount {
  let testRange = readLine()!.intComponents
  tests.append(testRange[0]...testRange[1])
}

for test in tests {
  print(test.squaresCount)
}

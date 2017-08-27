#!/usr/bin/swift

import Foundation

extension Array where Iterator.Element == String {
  var collected: Dictionary<String, Int> {
    var collected = Dictionary<String, Int>()
    for element: String in self {
      if var _collected = collected[element] {
        _collected += 1
        collected[element] = _collected
      } else {
        collected[element] = 1
      }
    }
    return collected
  }
  
  var collectedPairs: Int {
    return self.collected.reduce(0) { (result, collected) in {
        return result + Int(floor(Double(collected.value)/2.0))
      }()
    }
  }
}

_ = readLine()!

let socks = readLine()!.components(separatedBy: String(" "))

print(socks.collectedPairs)


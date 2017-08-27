#!/usr/bin/swift

import Foundation

struct Hike {
  let steps: [Int]
  
  var valleys: Int {
    var valleys = 0
    var previousElevation = 0
    for step in steps {
      let elevation = previousElevation + step
      
      if elevation == 0 && previousElevation < 0 {
        valleys += 1
      }
      
      previousElevation = elevation
    }
    
    return valleys
  }
  
  init(steps: String) {
    self.steps = steps.characters.map {
      return $0 == "U" ? 1 : -1
    }
  }
}

_ = readLine()!

let hike = Hike(steps: readLine()!)

print(hike.valleys)

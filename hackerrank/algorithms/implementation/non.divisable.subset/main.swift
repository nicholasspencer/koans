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

extension Array where Iterator.Element == Int {
  func nonDivisableSubsetCount(divisor: Int) -> Int {
    let divided: [Int] = self.map({ $0 / divisor})
    
    var result = 0
    
    for element in divided {
      
    }
    
    return result
    
    
    
    
    
//    var result = 0
//    
//    for (index, outer) in self.enumerated() {
//      for inner in index+1...self.count {
//        let sum = outer + inner
//        let remainder = sum % divisor
//        result += remainder == 0 ? 1 : 0
//      }
//    }
//    
//    return result
  }
}

//let divisor: Int = readLine()!.intComponents[1]
let divisor = 5

//let set: [Int] = readLine()!.intComponents
let set = "2 7 12 17 22".intComponents

print(set.nonDivisableSubsetCount(divisor: divisor))

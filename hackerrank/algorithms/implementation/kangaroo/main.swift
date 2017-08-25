#!/usr/bin/swift

import Foundation

extension String {
  func intComponents() -> [Int] {
    return self.components(separatedBy: String(" ")).map {
      return Int($0)!
    }
  }
}

struct Kangaroo {
  let position: Int
  let speed: Int
  
  static func converges(one: Kangaroo, two: Kangaroo) -> Bool {
    if one.speed < two.speed {
      return false
    }
    
    
    
    return true
  }
}

//let input = readLine()!.intComponents()
//let input = "0 3 4 2".intComponents()
let input = "0 2 5 3".intComponents()

let kangarooOne = Kangaroo(position: input[0], speed: input[1])
let kangarooTwo = Kangaroo(position: input[2], speed: input[3])


print(kangarooOne, kangarooTwo)

let converges = Kangaroo.converges(one: kangarooOne, two: kangarooTwo)

print(converges)

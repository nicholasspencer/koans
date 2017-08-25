#!/usr/bin/swift

import Foundation

extension String {
  var intComponents: [Int] {
    return self.components(separatedBy: String(" ")).map {
      return Int($0)!
    }
  }
}

extension Int {
  static func greatestCommonDivisor(_ left: Int, _ right: Int) -> Int {
    var a = left
    var b = right
    
    while b > 0 {
      let temp = b
      b = a % b
      a = temp
    }
    
    return a
  }
  
  static func leastCommonMultiple(_ left: Int, _ right: Int) -> Int {
    return left * (right / greatestCommonDivisor(left, right))
  }
  
  func greatestCommonDivisor(_ right: Int) -> Int {
    return Int.greatestCommonDivisor(self, right)
  }
  
  func leastCommonMultiple(_ right: Int) -> Int {
    return Int.leastCommonMultiple(self, right)
  }
}

extension Array where Iterator.Element == Int {
  var greatestCommonDivisor: Int? {
    if self.count == 0 {
      return nil
    }
    
    if self.count == 1 {
      return self[0]
    }
    
    return self.enumerated().dropFirst().reduce(self[0]) { result, next in
      return result.greatestCommonDivisor(next.element)
    }
  }
  
  var leastCommonMultiple: Int? {
    if self.count == 0 {
      return nil
    }
    
    if self.count == 1 {
      return self[0]
    }
    
    return self.enumerated().dropFirst().reduce(self[0]) { result, next in
      return result.leastCommonMultiple(next.element)
    }
  }
  
  static func inBetween(_ setOne: [Int], _ setTwo: [Int]) -> [Int] {
    let lcm = setOne.leastCommonMultiple!
    let gcd = setTwo.greatestCommonDivisor!
    
    var inBetween: [Int] = []
    
    var multiple = lcm
    var multiplier = 2
    while multiple <= gcd  {
      if gcd % multiple == 0 {
        inBetween.append(multiple)
      }
      
      multiple = lcm * multiplier
      multiplier += 1
    }
    
    return inBetween
  }
}

_ = readLine()!

let setOne: [Int] = readLine()!.intComponents
let setTwo: [Int] = readLine()!.intComponents
//let setOne: [Int] = "2 4".intComponents
//let setTwo: [Int] = "16 32 96".intComponents

print(Array.inBetween(setOne, setTwo).count)



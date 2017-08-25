#!/usr/bin/swift

import Foundation

extension Int {
  var factorial:[Int] {
    get {
      if self == 1 {
        return [1]
      }
      
      var result = Array(repeating: 0, count: 1000)
      result[0] = 1
      
      var length = 1
      
      for value in 2...self {
        var carry = 0
        
        for place in 0...length-1 {
          let partialResult = value * result[place] + carry
          let digit = partialResult % 10
          result[place] = digit
          carry = partialResult / 10;
        }
        
        while carry>0 {
          length += 1
          let digit = carry % 10
          result[length - 1] = digit
          carry = carry / 10
        }
      }
      
      var leftZero = true
      result = result.reversed().flatMap {
        if leftZero == false {
          return $0
        } else if $0 > 0 {
          leftZero = false
          return $0
        } else {
          return nil
        }
      }
      
      return result
    }
  }
}

let input: Int = Int(readLine()!)!

print(input.factorial.map({ String($0) }).joined())

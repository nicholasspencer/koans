#!/usr/bin/swift

import Foundation

// let inputParameters: String = readLine()!
// let input: String = readLine()!

let inputParameters: String = "6 9"
let input: String = "422346306 940894801 696810740 862741861 85835055 313720373"

let parameters: [Int] = inputParameters.components(separatedBy: String(" ")).map { return Int($0)! }
let divisor = Double(parameters.last!)
let numbers: [Double] = input.components(separatedBy: String(" ")).map { return Double($0)! / divisor }

var counts: Int = numbers.reduce(0, { result, number in
  for innerNumber in numbers {
    if innerNumber == number {
      return result
    }

    if innerNumber + number == 1 {
      return result + 1
    }
  }

  return result
})


print(counts)
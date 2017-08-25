#!/usr/bin/swift

import Foundation

func cut(_ sticks: [Int]) -> [Int] {
  let cutBy: Int = sticks.min()!
  return sticks.map {
    $0 - cutBy
  }.filter {
    $0 > 0
  }
}

let inputLength: String = readLine()!
let input: String = readLine()!

// let inputLength: String = "8"
// let input: String = "1 2 3 4 3 3 2 1"

var sticks: [Int] = input.components(separatedBy: String(" ")).map { return Int($0)! }

while sticks.count > 0 {
  print(sticks.count)
  sticks = cut(sticks)
}
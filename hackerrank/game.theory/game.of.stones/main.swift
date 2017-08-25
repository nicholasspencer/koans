#!/usr/bin/swift

import Foundation

let inputSize: Int = Int(readLine()!)!

for index in 1...inputSize {
  let testCase: Int = Int(readLine()!)!
  let winner: String = (testCase % 7 < 2) ? "Second" : "First"
  print(winner)
}
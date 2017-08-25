#!/usr/bin/swift

import Foundation

extension String {
  var ints: [Int] {
    return self.components(separatedBy: String(" ")).map {
      return Int($0)!
    }
  }
}

extension Array where Iterator.Element == Int {
  func sum(from: Int, length: Int) -> Int {
    return self[from..<(from+length)].reduce(0, +)
  }
}

//let squares = "1 1 1 1 1 1".ints
//let birthDay = 3
//let birthMonth = 2

_ = readLine()!

let squares: [Int] = readLine()!.ints

let birthInfo: [Int] = readLine()!.ints
let birthDay: Int =  birthInfo[0]
let birthMonth: Int =  birthInfo[1]

let sum = birthDay
let length = birthMonth

var sequenceCount = 0

for index in 0...(squares.count-length) {
  if sum == squares.sum(from: index, length: length) {
    sequenceCount += 1
  }
}

print(sequenceCount)

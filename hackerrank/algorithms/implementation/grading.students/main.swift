#!/usr/bin/swift

import Foundation

func round(grade: Int) -> Int {
  if grade < 38 {
    return grade
  }
  
  let nextRoundPoint = grade + (5 - (grade % 5))
  
  if nextRoundPoint - grade < 3 {
    return nextRoundPoint
  }
  
  return grade
}

let numberOfStudents: Int = Int(readLine()!)!

for _ in 1...numberOfStudents {
  print(round(grade: Int(readLine()!)!))
}

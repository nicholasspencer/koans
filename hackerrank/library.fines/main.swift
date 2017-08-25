#!/usr/bin/swift

import Foundation

func dayFines(_ returned: Int, _ due: Int) -> Int {
  let daysLate = returned - due;
  return daysLate * 15
}

func monthFines(_ returned: Int, _ due: Int) -> Int {
  let monthsLate = returned - due;
  return monthsLate * 500
}

func yearFines(_ returned: Int, _ due: Int) -> Int {
  let yearsLate = returned - due;
  return yearsLate * 10000;
}

func fines(_ returned: String, _ due: String) -> Int {
  let returnedComponents: [Int] = returned.components(separatedBy: String(" ")).map { return Int($0)! }
  let dueComponents: [Int] = due.components(separatedBy: String(" ")).map { return Int($0)! }

  var fines = yearFines(returnedComponents[2], dueComponents[2])

  if fines == 0 {
    fines = monthFines(returnedComponents[1], dueComponents[1])
  }

  if fines == 0 {
    fines = dayFines(returnedComponents[0], dueComponents[0])
  }

  return min((fines <= 0) ? 0 : fines, 10000);
}

// let returnDate: String = readLine()!
// let dueDate: String = readLine()!

let returnDate = "15 7 2014"
let dueDate = "1 7 2015"

print(fines(returnDate, dueDate))
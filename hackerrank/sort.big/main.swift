#!/usr/bin/swift

import Foundation

let inputSize: Int = Int(readLine()!)!
var numbers: [String] = [readLine()!]

for index in 2...inputSize {
  let newNumber = readLine()!
  if newNumber.characters.count < numbers.first!.characters.count {
    numbers.insert(newNumber, at: 0)
  } else if newNumber.characters.count < numbers.last!.characters.count {
    numbers.insert(newNumber, at: index-1)
  } else {
    numbers.append(newNumber)
  }
}

func bigNumber(_ one: String, _ two: String) -> Bool {
  if one.characters.count == two.characters.count {
    for index in 0...one.characters.count-1 {
      let charOne = one[one.index(one.startIndex, offsetBy: index)]
      let charTwo = two[two.index(two.startIndex, offsetBy: index)]
      if charOne != charTwo {
        return charOne < charTwo
      }
    }
  }
  return one.characters.count < two.characters.count
}

let output: String = numbers.sorted(by: bigNumber).reduce("") { result, string in 
  result + "\(string)\n"
}

print(output)
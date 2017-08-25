#!/usr/bin/swift

// https://projecteuler.net/problem=1

var sum: Int = 0

for num in 0...9 {
  if num % 3 == 0 || num % 5 == 0 {
    sum = sum + num
  }
}

print(sum)
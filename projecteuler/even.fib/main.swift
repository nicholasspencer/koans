#!/usr/bin/swift

// https://projecteuler.net/problem=2

var evens: [Int] = [2]
var seq: [Int] = [1,2]

while seq.last! < 4000 {
  let next = seq.last! + seq[seq.count - 2]
  seq.append(next)
  if next % 2 == 0 {
    evens.append(next)
  }
}

print(evens)
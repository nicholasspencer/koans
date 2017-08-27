#!/usr/bin/swift

import Foundation

extension String {
  var ints: [Int] {
    return self.components(separatedBy: String(" ")).map {
      return Int($0)!
    }
  }
}

struct Scenario {
  let catA: Int
  let catB: Int
  let mouse: Int
  
  var catADistance: Int {
    return abs(catA - mouse)
  }
  
  var catBDistance: Int {
    return abs(catB - mouse)
  }
  
  var result: String {
    if catADistance == catBDistance {
      return "Mouse C"
    } else if catADistance < catBDistance {
      return "Cat A"
    } else {
      return "Cat B"
    }
  }
}

let scenerios: [Scenario] = (0 ..< Int(readLine()!)!).map { _ in
  let scenerio = readLine()!.ints
  return Scenario(catA: scenerio[0], catB: scenerio[1], mouse: scenerio[2])
}

scenerios.forEach {
  print($0.result)
}

#!/usr/bin/swift

import Foundation

extension String {
  var ints: [Int] {
    return self.components(separatedBy: String(" ")).map {
      return Int($0)!
    }
  }
}

struct Scores {
  private var scores: [Int] = []
  
  private var _lowRecords: [Int] = []
  private var _highRecords: [Int] = []
  
  var lowRecordsChangeCount: Int {
    return _lowRecords.count - 1
  }
  
  var highRecordsChangeCount: Int {
    return _highRecords.count - 1
  }
  
  init?(_ scores: [Int]) {
    guard scores.count > 0 else {
      return nil
    }
    
    scores.forEach { add(score: $0) }
  }
  
  mutating func add(score: Int) {
    if let lowRecord = _lowRecords.last, lowRecord > score {
      _lowRecords.append(score)
    } else if _lowRecords.isEmpty {
      _lowRecords.append(score)
    }
    
    if let highRecord = _highRecords.last, highRecord < score {
      _highRecords.append(score)
    } else if _highRecords.isEmpty {
      _highRecords.append(score)
    }
  }
}

_ = readLine()! // Junk
if let scores: Scores = Scores(readLine()!.ints) {
  print(scores.highRecordsChangeCount, scores.lowRecordsChangeCount)
}



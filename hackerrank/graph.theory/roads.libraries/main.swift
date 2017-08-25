#!/usr/bin/swift

import Foundation

class Vertex {
  let order: Int
  var visited: Bool = false

  init(_ order: Int) {
    self.order = order
  }
}

class Edge {
  let vertexLeft: Vertex
  let vertexRight: Vertex
  
  init(_ vertexLeft: Vertex, _ vertexRight: Vertex) {
    self.vertexLeft = vertexLeft
    self.vertexRight = vertexRight
  }
}

class Graph {
  let cityCount: Int
  let roadCount: Int
  let libraryCost: Int
  let roadCost: Int

  var vertices: [Vertex] = []

  var cost: Int {

  }

  init(cityCount: Int, roadCount: Int, libraryCost: Int, roadCost: Int) {
    self.cityCount = cityCount
    self.roadCount = roadCount
    self.libraryCost = libraryCost
    self.roadCost = roadCost
  }

  convenience init(string: String) {
    let components: [Int] = string.components(separatedBy: String(" ")).map { return Int($0)! }
    self.init(cityCount: components[0], roadCount: components[1], libraryCost: components[2], roadCost: components[3])
  }
}

let graphCount: Int = Int(readLine()!)!

for _ in 1...graphCount {
  let graphString: String = readLine()!

  let graph = Graph(string: graphString)

  
}
#!/usr/bin/swift

import Foundation

extension String {
  func intComponents() -> [Int] {
    return self.components(separatedBy: String(" ")).map {
      return Int($0)!
    }
  }
}

struct House {
  var left = 0
  var right = 0
  
  func contains(tree: Tree, fruit: Fruit) -> Bool {
    return fruit.point(tree: tree) >= self.left && fruit.point(tree: tree) <= self.right
  }
}

struct Fruit {
  var distance = 0
  
  init(distance: Int) {
    self.distance = distance
  }
  
  func point(tree: Tree) -> Int {
    return tree.point + self.distance
  }
}

struct Tree {
  var point = 0
  var fruit: [Fruit] = []
  
  init(point: Int) {
    self.point = point
  }
}

struct Property {
  var house = House()
  var trees: [Tree] = []
  
  func fruitHouseUnion() -> [[Fruit]] {
    var fruits: [[Fruit]] = []
    
    for (index, tree) in self.trees.enumerated() {
      fruits.append([])
      for fruit in tree.fruit {
        if house.contains(tree: tree, fruit: fruit) {
          fruits[index].append(fruit)
        }
      }
    }
    
    return fruits
  }
}

var property = Property()

let houseInput: [Int] = readLine()!.intComponents()
property.house = House(left: houseInput[0], right: houseInput[1]);

let treesInput: [Int] = readLine()!.intComponents()
for treeInput in treesInput {
  property.trees.append(Tree(point: treeInput))
}

let fruitInput: [Int] = readLine()!.intComponents()

let applesInput: [Int] = readLine()!.intComponents()
for var appleInput in applesInput {
  property.trees[0].fruit.append(Fruit(distance: appleInput))
}

let orangesInput: [Int] = readLine()!.intComponents()
for var orangeInput in orangesInput {
  property.trees[1].fruit.append(Fruit(distance: orangeInput))
}

for tree in property.fruitHouseUnion() {
  print(tree.count)
}

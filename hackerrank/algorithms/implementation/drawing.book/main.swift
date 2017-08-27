#!/usr/bin/swift

import Foundation

struct Book {
  let pages: Int
  
  private func startingPage(desiredPage: Int) -> Int {
    if desiredPage <= pages/2 {
      return 1
    }
    return pages
  }
  
  func pagesToTurn(to page: Int) -> Int {
    let startingPage = self.startingPage(desiredPage: page)
    
    var pageTurns = 0
    if startingPage == pages {
      if startingPage % 2 == 0 && startingPage - page == 1 {
        pageTurns = 1
      } else {
        pageTurns = Int(floor(Double(startingPage - page) / 2.0))
      }
    } else {
      pageTurns = Int(floor(Double(page) / 2.0))
    }
    return pageTurns
  }
}

let pages: Int = Int(readLine()!)!
let page: Int = Int(readLine()!)!

let book = Book(pages: pages)

print(book.pagesToTurn(to: page))

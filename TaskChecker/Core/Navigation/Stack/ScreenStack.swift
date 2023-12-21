//
//  ScreenStack.swift
//  TaskChecker
//
//  Created by admin on 21.12.2023.
//

import Foundation

struct ScreenStack<T: ScreenDelegate> {
    var routes: [T] = []
    
    mutating func push(_ s: T) {
        self.routes.append(s)
    }
    
    mutating func pop() {
        _ = self.routes.popLast()
    }
    
    mutating func popToRoot() {
        self.routes.removeAll()
    }
    
    func top() -> T? {
        return self.routes.last
    }
}

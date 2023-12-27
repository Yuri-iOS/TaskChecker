//
//  ScreenRouter.swift
//  TaskChecker
//
//  Created by admin on 21.12.2023.
//

import SwiftUI

final class ScreenRouter<V: ScreenDelegate>: ObservableObject {
    @Published var route: V?
    @Published var direction: ScreenDirection = .forward
    
    var screenStack = ScreenStack<V>() {
        didSet {
            self.route = screenStack.top()
        }
    }
    
    private let pushAnimation: Animation
    private let popAnimation: Animation
    private let popToRootAnimation: Animation
    
    init(
        route: V?,
        pushAnimation: Animation = Animation.smooth(duration: 0.24),
        popAnimation: Animation = Animation.smooth(duration: 0.24),
        popToRootAnimation: Animation = Animation.linear(duration: 0.24)
    ) {
        self.route = route
        self.pushAnimation = pushAnimation
        self.popAnimation = popAnimation
        self.popToRootAnimation = popToRootAnimation
    }
    
    func push(route: V) {
        withAnimation(pushAnimation) {
            direction = .forward
            screenStack.push(route)
        }
    }
    
    func pop() {
        withAnimation(popAnimation) {
            direction = .backward
            screenStack.pop()
        }
    }
    
    func popToRoot() {
        withAnimation(popToRootAnimation) {
            direction = .backward
            screenStack.popToRoot()
        }
    }
    
    func resetStack(route: V) {
        withAnimation(pushAnimation) {
            direction = .backward
            screenStack.reset(route)
        }
    }

    enum ScreenDirection {
        case forward
        case backward
    }
}

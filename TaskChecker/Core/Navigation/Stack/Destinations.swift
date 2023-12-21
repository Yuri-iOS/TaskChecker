//
//  ScreenRouteDestination.swift
//  TaskChecker
//
//  Created by admin on 21.12.2023.
//

import Foundation

enum BaseStateDestination: ScreenDelegate {
    case auth
    case onboarding
    case base
    
    static func checkInitalize() -> BaseStateDestination {
        if StorageManager.shared.authorized && StorageManager.shared.onboardingPresented {
            return .base
        }
        if StorageManager.shared.authorized && !StorageManager.shared.onboardingPresented {
            return .onboarding
        }
        if (!StorageManager.shared.authorized && !StorageManager.shared.onboardingPresented) ||
            (!StorageManager.shared.authorized && StorageManager.shared.onboardingPresented) {
            return .auth
        }
        return .base
    }
}

enum ScreenRouteDestination: ScreenDelegate, CaseIterable {
    case events
    case allGoals
    case calendar
    case profile
    
    var screen: TabBarData<ScreenRouteDestination> {
        switch self {
        case .events:
            return TabBarData(title: "home", icon: "house.fill", destination: .events)
        case .allGoals:
            return TabBarData(title: "allEvents", icon: "list.bullet", destination: .allGoals)
        case .calendar:
            return TabBarData(title: "calendar", icon: "calendar", destination: .calendar)
        case .profile:
            return TabBarData(title: "profile", icon: "person.fill", destination: .profile)
        }
    }
}

enum OnboardingRouteDestination {
    case onboardingScreen1
    case onboardingScreen2
    case onboardingScreen3
    case subscribe
}

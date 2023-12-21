//
//  CustomTabBar.swift
//  TaskChecker
//
//  Created by admin on 21.12.2023.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selection: ScreenRouteDestination
    
    var body: some View {
        HStack(spacing: 0) {
//            ForEach(ScreenRouteDestination.allCases, id: \.self) { route in
//                TabBarButton(image: route.screen.icon, text: route.screen.title, index: route, selection: $selection)
//            }
            TabBarButton(image: ScreenRouteDestination.events.screen.icon, text: ScreenRouteDestination.events.screen.title, index: .events, selection: $selection)
            TabBarButton(image: ScreenRouteDestination.allGoals.screen.icon, text: ScreenRouteDestination.allGoals.screen.title, index: .allGoals, selection: $selection)
            TabBarButton(image: ScreenRouteDestination.calendar.screen.icon, text: ScreenRouteDestination.calendar.screen.title, index: .calendar, selection: $selection)
            TabBarButton(image: ScreenRouteDestination.profile.screen.icon, text: ScreenRouteDestination.profile.screen.title, index: .profile, selection: $selection)
        }
        .frame(maxWidth: .infinity)
//        .background(.red)
        
    }
}

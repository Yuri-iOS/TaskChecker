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
                ForEach(ScreenRouteDestination.allCases, id: \.self) { route in
                    TabBarButton(image: route.screen.icon, text: String(localized: route.screen.title), index: route, selection: $selection)
                }
            }
            .frame(maxWidth: .infinity)

        
    }
}

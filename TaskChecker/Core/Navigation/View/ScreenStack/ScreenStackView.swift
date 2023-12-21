//
//  ScreenStackView.swift
//  TaskChecker
//
//  Created by admin on 21.12.2023.
//

import SwiftUI

struct ScreenStackView: View {
    @EnvironmentObject var screenRouter: ScreenRouter<ScreenRouteDestination>
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: .init(get: {
                screenRouter.route ?? .events
            }, set: {
                screenRouter.route = $0
            }), content: {
                Group {
                    BaseEventsView()
                        .tag(ScreenRouteDestination.events)
                    BaseAllEventsView()
                        .tag(ScreenRouteDestination.allGoals)
                    BaseCalendarView()
                        .tag(ScreenRouteDestination.calendar)
                    BaseProfileView()
                        .tag(ScreenRouteDestination.profile)
                        
                }
                .gesture(DragGesture())
            })
            .tabViewStyle(.page(indexDisplayMode: .never))
            CustomTabBar(selection: .init(get: {
                screenRouter.route ?? .events
            }, set: {
                screenRouter.route = $0
            })).frame(height: 60)
        }
    }
}

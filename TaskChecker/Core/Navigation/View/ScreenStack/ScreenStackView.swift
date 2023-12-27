//
//  ScreenStackView.swift
//  TaskChecker
//
//  Created by admin on 21.12.2023.
//

import SwiftUI

struct ScreenStackView: View {
    @EnvironmentObject var screenRouter: ScreenRouter<ScreenRouteDestination>
    @StateObject var eventsModel = BaseEventsModel()
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                TabView(selection: .init(get: {
                    screenRouter.route ?? .events
                }, set: {
                    screenRouter.route = $0
                }), content: {
                    Group {
                        BaseEventsView()
                            .environmentObject(eventsModel)
                            .tag(ScreenRouteDestination.events)
                            .gesture(DragGesture())
                        BaseAllEventsView()
                            .tag(ScreenRouteDestination.allGoals)
                        BaseCalendarView()
                            .tag(ScreenRouteDestination.calendar)
                        BaseProfileView()
                            .tag(ScreenRouteDestination.profile)
                            
                    }
    //                .gesture(DragGesture())
                })
                .tabViewStyle(.page(indexDisplayMode: .never))
                CustomTabBar(selection: .init(get: {
                    screenRouter.route ?? .events
                }, set: {
                    screenRouter.route = $0
                })).frame(height: 60)
            }
            if screenRouter.route == .events {
                VStack {
                    Spacer()
                    BaseNewTaskButton {
                        eventsModel.newEventPresented.toggle()
                    }
                }
 
            }
        }
        .onAppear {
            NotificationService.permission()
        }

    }
}

//#Preview {
//    ScreenStackView().environmentObject(ScreenRouter<ScreenRouteDestination>(route: .events)).preferredColorScheme(.dark)
//}
//#Preview {
//    ScreenStackView().environmentObject(ScreenRouter<ScreenRouteDestination>(route: .events)).preferredColorScheme(.light)
//}

//
//  BaseStackView.swift
//  TaskChecker
//
//  Created by admin on 21.12.2023.
//

import SwiftUI

struct BaseStackView: View {
    @StateObject var baseStateRouter = ScreenRouter<BaseStateDestination>(route: .checkInitalize())
    @StateObject var screenRouter = ScreenRouter<ScreenRouteDestination>(route: .events)
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea(.all)
            switch baseStateRouter.route {
            case .auth:
                VStack {
                    Text("auth")
                    Button(action: {
                        StorageManager.shared.setAuthorized(true)
                        baseStateRouter.push(route: .onboarding)
                    }, label: {
                        Text("to onb")
                    })
                }
            case .onboarding:
                VStack {
                    Text("onb")
                    Button(action: {
                        StorageManager.shared.setOnboardingPresented(true)
                        baseStateRouter.push(route: .base)
                    }, label: {
                        Text("to base")
                    })
                }
            default:
                ScreenStackView()
                    .environmentObject(screenRouter)
//                    .ignoresSafeArea(.all)
            }
        }
    }
}

//#Preview {
//    BaseStackView(baseStateRouter: <#T##arg#>, screenRouter: <#T##arg#>)
//}

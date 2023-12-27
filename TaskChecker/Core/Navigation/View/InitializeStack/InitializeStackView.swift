//
//  BaseStackView.swift
//  TaskChecker
//
//  Created by admin on 21.12.2023.
//

import SwiftUI

struct InitializeStackView: View {
    @StateObject var initializeStateRouter = ScreenRouter<InitializeRouteDestination>(route: .checkInitalize())
    @StateObject var screenRouter = ScreenRouter<ScreenRouteDestination>(route: .events)
    @StateObject var authRepository = AuthRepositoryImpl()
    @StateObject var taskRepository = TaskRepositoryImpl()
    
    var body: some View {
        ZStack {
            Color.blueMain.ignoresSafeArea(.all)
//            VStack {
//                HStack {
//                    Button(action: {
//                        initializeStateRouter.pop()
//                    }, label: {
//                        Text("back")
//                    })
//                }
//                Spacer()
//            }
            switch initializeStateRouter.route {
            case .auth:
                if authRepository.user == nil {
                    AuthView(
                        signInCompletion: { email, password in
                            authRepository.signInWithEmail(email: email, password: password, completion: { user, error in
                                if error == nil {
                                    authComplete()
                                }
                            })
                    }, signUpCompletion: { email, password in
                        authRepository.signUpWithEmail(email: email, password: password, completion: { user, error in
                            if error == nil {
                                authComplete()
                            }
                        })
                    })
                } else {
                    Text("\(authRepository.user?.description ?? "")")
                }
     
            case .onboarding:
                VStack {
                    Text("onb")
                    Button(action: {
                        StorageManager.shared.setOnboardingPresented(true)
                        initializeStateRouter.push(route: .base)
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
        .onAppear {
            authRepository.listenToAuthState()
        }
        .environmentObject(authRepository)
        .environmentObject(taskRepository)
        .environmentObject(initializeStateRouter)
        
    }
    
    private func authComplete() {
        StorageManager.shared.setAuthorized(true)
        if !StorageManager.shared.onboardingPresented {
            initializeStateRouter.push(route: .onboarding)
        } else {
            initializeStateRouter.push(route: .base)
        }
        authRepository.listenToAuthState()
        //oE5dgCjjIwNIY1TOLH6YhU7HrFX2
    }
}



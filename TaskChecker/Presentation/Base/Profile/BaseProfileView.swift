//
//  BaseProfileView.swift
//  TaskChecker
//
//  Created by admin on 21.12.2023.
//

import SwiftUI

struct BaseProfileView: View {
    @EnvironmentObject var authRepository: AuthRepositoryImpl
    @EnvironmentObject var initialRouter: ScreenRouter<InitializeRouteDestination>
    @EnvironmentObject var screenRouter: ScreenRouter<ScreenRouteDestination>
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea(.all)
            VStack {
//                Button(action: {
//                    authRepository.signOut(completion: { error in
//                        if error == nil {
//                            StorageManager.shared.setAuthorized(false)
//                            initialRouter.route = .auth
//                            print(initialRouter.screenStack)
//                        }
//                    })
//                }, label: {
//                    Text("sign out")
//                })
                Button(action: {
                    
                    authRepository.signOut(completion: { error in
                        if error == nil {
                            StorageManager.shared.setAuthorized(false)
                            initialRouter.resetStack(route: .auth)
                            screenRouter.resetStack(route: .events)
                        }
                    })
                }, label: {
                    Text("sign out hole stack")
                })
                Button(action: {
                    print(authRepository.user?.uid)
                }, label: {
                    Text("print id")
                })
            }
        }
    }
}

//#Preview {
//    BaseProfileView()
//}

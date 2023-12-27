//
//  AuthView.swift
//  TaskChecker
//
//  Created by admin on 26.12.2023.
//

import SwiftUI

struct AuthView: View {
    @StateObject var authModel = AuthModel()
    let signInCompletion: (String, String) -> Void
    let signUpCompletion: (String, String) -> Void
    var body: some View {
        VStack {
            switch authModel.signState {
            case .signIn:
                AuthSignInView { email, password in
                    signInCompletion(email, password)
                }
            case .signUp:
                AuthSignUpView { email, password in
                    signUpCompletion(email, password)
                }
            }
            Button(action: {
                authModel.signState = authModel.signState == .signIn ? .signUp : .signIn
            }, label: {
                Text(authModel.signState.value)
            })
        }
        .environmentObject(authModel)
    }
}


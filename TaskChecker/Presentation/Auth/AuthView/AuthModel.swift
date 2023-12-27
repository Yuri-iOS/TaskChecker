//
//  AuthViewModel.swift
//  TaskChecker
//
//  Created by admin on 26.12.2023.
//

import SwiftUI


final class AuthModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var confirmationPassword = ""
    @Published var signState: SignState = .signIn
    
    func reset() {
        email = ""
        password = ""
        confirmationPassword = ""
    }
    
    enum SignState: String {
        case signIn, signUp
        
        var value: String {
            switch self {
            case .signIn:
                return "SignUp"
            case .signUp:
                return "SignIn"
            }
        }
    }
}



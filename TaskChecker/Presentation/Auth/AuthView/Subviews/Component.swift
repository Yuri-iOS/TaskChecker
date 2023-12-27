//
//  AuthView.swift
//  TaskChecker
//
//  Created by admin on 26.12.2023.
//

import SwiftUI

struct AuthSignInView: View {
    @EnvironmentObject var signModel: AuthModel
    let signInCompletion: (String, String) -> Void
    var body: some View {
        VStack {
            AuthSignEmailFieldView(text: $signModel.email)
            AuthSignPasswordFieldView(password: $signModel.password)
            Button(action: {
                signInCompletion(signModel.email, signModel.password)
            }, label: {
                Text("sign in")
            })
        }
    }
}

struct AuthSignUpView: View {
    @EnvironmentObject var signModel: AuthModel
    let signUpCompletion: (String, String) -> Void
    var body: some View {
        VStack {
            AuthSignEmailFieldView(text: $signModel.email)
            AuthSignPasswordFieldView(password: $signModel.password)
            AuthSignPasswordFieldView(password: $signModel.confirmationPassword, placeHolder: "confirm password")
            Button(action: {
                if signModel.password == signModel.confirmationPassword {
                    signUpCompletion(signModel.email, signModel.password)
                }
            }, label: {
                Text("sign up")
            })
        }
    }
}

struct AuthSignEmailFieldView: View {
    @Binding var text: String
    var body: some View {
        TextField("email", text: $text)
            .keyboardType(.emailAddress)
            .autocorrectionDisabled(true)
            .textInputAutocapitalization(.never)
            .padding()
            .foregroundStyle(.black)
            .background(RoundedRectangle(cornerRadius: 16).fill(Color.yellow))
            .padding(.horizontal)
    }
}

struct AuthSignPasswordFieldView: View {
    @Binding var password: String
    var placeHolder = "password"
    var body: some View {
        SecureField(placeHolder, text: $password)
            .textContentType(.password)
            .autocorrectionDisabled(true)
            .textInputAutocapitalization(.never)
            .padding()
            .foregroundStyle(.black)
            .background(RoundedRectangle(cornerRadius: 16).fill(Color.yellow))
            .padding(.horizontal)
    }
}


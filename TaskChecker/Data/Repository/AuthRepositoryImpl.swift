//
//  AuthRepositoryImpl.swift
//  TaskChecker
//
//  Created by admin on 26.12.2023.
//

import SwiftUI
import FirebaseAuth

final class AuthRepositoryImpl: ObservableObject, AuthRepository {
    
    var user: User? {
        didSet {
            objectWillChange.send()
        }
    }
    
    func listenToAuthState() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let self = self else {
                return
            }
            self.user = user
        }
    }
    
    func signUpWithEmail(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            completion(user, error)
        }
    }
    
    func signInWithEmail(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            completion(user, error)
        }
    }
    
    func signOut(completion: @escaping (Error?) -> Void) {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            completion(nil)
        } catch {
            completion(error)
        }
    }
}

//
//  AuthRepository.swift
//  TaskChecker
//
//  Created by admin on 26.12.2023.
//

import Foundation
import FirebaseAuth

protocol AuthRepository {
    func listenToAuthState()
    func signUpWithEmail(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void)
    func signInWithEmail(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void)
    func signOut(completion: @escaping (Error?) -> Void)
}

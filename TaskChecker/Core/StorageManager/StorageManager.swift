//
//  StorageManager.swift
//  TaskChecker
//
//  Created by admin on 21.12.2023.
//

import SwiftUI

final class StorageManager {
    static let shared = StorageManager()
    private init() {}
    
    @AppStorage(SMKeys.AUTHORIZED) private(set) var authorized = false
    @AppStorage(SMKeys.ONBOARDING_PRESENTED) private(set) var onboardingPresented = false
    
    func setAuthorized(_ b: Bool) {
        authorized = b
    }
    
    func setOnboardingPresented(_ b: Bool) {
        onboardingPresented = b
    }
    
}

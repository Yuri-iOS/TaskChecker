//
//  BaseEventsNewEventModel.swift
//  TaskChecker
//
//  Created by admin on 26.12.2023.
//

import SwiftUI

extension BaseEventsNewEventView {
    final class BaseEventsNewEventModel: ObservableObject {
        @Published var title = ""
        @Published var note = ""
        @Published private(set) var errorMessage = ""
        @Published private(set) var errorAppear = false
        
        func setError(_ e: String) {
            errorMessage = e
            errorAppear = true
        }
        
        func resetError() {
            errorMessage = ""
            errorAppear = false
        }
    }
}

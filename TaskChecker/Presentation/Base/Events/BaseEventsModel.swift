//
//  BaseEventsModel.swift
//  TaskChecker
//
//  Created by admin on 22.12.2023.
//

import SwiftUI

final class BaseEventsModel: ObservableObject {
    @Published var dayPartData = DayPartStorageManager.shared.getDayPartSelection()
    @Published var pickerState = PickerDestination.getPartOfTheDay()
    @Published var settingsPresented = false
    @Published var newEventPresented = false
    @Published private(set) var tasksState: TasksInitState = .loading
//    @Published var
    
    func refreshDayPartData() {
        dayPartData = DayPartStorageManager.shared.getDayPartSelection()
    }
    
    func setLoadingState() {
        DispatchQueue.main.async {
            self.tasksState = .loading
        }
    }
    
    func setSuccessState() {
        DispatchQueue.main.async {
            self.tasksState = .success
        }
    }
    
    func setErrorState(_ error: Error?) {
        DispatchQueue.main.async {
            self.tasksState = .failure(error: error)
        }
    }
    
    enum TasksInitState {
        case loading, success
        case failure(error: Error?)
    }
    
    
}

enum PickerDestination: String, CaseIterable {
    case morning
    case day
    case evening
    case night
    
    var nameOfPart: String.LocalizationValue {
        switch self {
        case .morning:
            return "morning"
        case .day:
            return "day"
        case .evening:
            return "evening"
        case .night:
            return "night"
        }
    }
    
    var value: String {
        switch self {
        case .morning:
            return "morning"
        case .day:
            return "day"
        case .evening:
            return "evening"
        case .night:
            return "night"
        }
    }
    
    static func getPartOfTheDay() -> PickerDestination {
        let part = DayPartStorageManager.shared.getDayPartSelection()
        switch Calendar.current.component(.hour, from: Date()) {
        case part.nightStart...part.nightEnd:
            return .night
        case part.morningStart...part.morningEnd:
            return .morning
        case part.dayStart...part.dayEnd:
            return .day
        default:
            return .evening
        }
    }
}



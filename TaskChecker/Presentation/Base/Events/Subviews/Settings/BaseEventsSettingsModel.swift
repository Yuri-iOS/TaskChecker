//
//  BaseEventsSettingsModel.swift
//  TaskChecker
//
//  Created by admin on 27.12.2023.
//

import SwiftUI

final class BaseEventsSettingsModel: ObservableObject {
    @Published private(set) var settingsState: SettingsState = .main
    
    @Published var mornigActiveState = DayPartStorageManager.shared.getDayPartSelection().morning
    @Published var dayActiveState = DayPartStorageManager.shared.getDayPartSelection().day
    @Published var eveningActiveState = DayPartStorageManager.shared.getDayPartSelection().evening
    @Published var nightActiveState = DayPartStorageManager.shared.getDayPartSelection().night
    
    @Published var morningStart = DayPartStorageManager.shared.getDayPartSelection().morningStart
    @Published var morningEnd = DayPartStorageManager.shared.getDayPartSelection().morningEnd
    @Published var dayStart = DayPartStorageManager.shared.getDayPartSelection().dayStart
    @Published var dayEnd = DayPartStorageManager.shared.getDayPartSelection().dayEnd
    @Published var eveningStart = DayPartStorageManager.shared.getDayPartSelection().eveningStart
    @Published var eveningEnd = DayPartStorageManager.shared.getDayPartSelection().eveningEnd
    @Published var nightStart = DayPartStorageManager.shared.getDayPartSelection().nightStart
    @Published var nightEnd = DayPartStorageManager.shared.getDayPartSelection().nightEnd
    
    func setSettingsState(_ s: SettingsState) {
        withAnimation {
            settingsState = s
        }
    }
    
    func setMorningData() {
        DayPartStorageManager.shared.setMorningPart(mornigActiveState, start: morningStart, end: morningEnd)
        mornigActiveState = DayPartStorageManager.shared.getDayPartSelection().morning
        morningStart = DayPartStorageManager.shared.getDayPartSelection().morningStart
        morningEnd = DayPartStorageManager.shared.getDayPartSelection().morningEnd
    }
    
    func setDayData() {
        DayPartStorageManager.shared.setDayPart(dayActiveState, start: dayStart, end: dayEnd)
        dayActiveState = DayPartStorageManager.shared.getDayPartSelection().day
        dayStart = DayPartStorageManager.shared.getDayPartSelection().dayStart
        dayEnd = DayPartStorageManager.shared.getDayPartSelection().dayEnd
    }
    
    func setEveningData() {
        DayPartStorageManager.shared.setEveningPart(eveningActiveState, start: eveningStart, end: eveningEnd)
        eveningActiveState = DayPartStorageManager.shared.getDayPartSelection().evening
        eveningStart = DayPartStorageManager.shared.getDayPartSelection().eveningStart
        eveningEnd = DayPartStorageManager.shared.getDayPartSelection().eveningEnd
    }
    
    func setNightData() {
        DayPartStorageManager.shared.setNightPart(nightActiveState, start: nightStart, end: nightEnd)
        nightActiveState = DayPartStorageManager.shared.getDayPartSelection().night
        nightStart = DayPartStorageManager.shared.getDayPartSelection().nightStart
        nightEnd = DayPartStorageManager.shared.getDayPartSelection().nightEnd
    }
    
    enum SettingsState {
        case main, morning, day, evening, night
    }
    
    func increaseTime(_ value: Binding<Int>) {
        if value.wrappedValue >= 23 {
            value.wrappedValue = 0
        } else {
            value.wrappedValue += 1
        }
    }
    
    func reduceTime(_ value: Binding<Int>) {
        if value.wrappedValue <= 0 {
            value.wrappedValue = 23
        } else {
            value.wrappedValue -= 1
        }
    }
}

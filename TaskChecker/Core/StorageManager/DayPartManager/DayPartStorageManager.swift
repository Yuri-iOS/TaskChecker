//
//  DayPartStorageManager.swift
//  TaskChecker
//
//  Created by admin on 22.12.2023.
//

import SwiftUI

final class DayPartStorageManager {
    static let shared = DayPartStorageManager()
    private init() {}
    
    @AppStorage(DPSMKeys.DAY_PART_SELECTION) private(set) var dayPartSelection: Data = DayPartData.initialValue()
    
    func setDayPartSeletion(_ data: DayPartData, completion: @escaping () -> Void) {
        do {
            if !data.morning && !data.day && !data.evening && !data.night {
                return
            }
            dayPartSelection = try JSONEncoder().encode(data)
            completion()
        } catch {
            print(error)
        }
    }
    
    func setMorningPart(_ state: Bool, start: Int = 4, end: Int = 11) {
        do {
            var temp = try JSONDecoder().decode(DayPartData.self, from: dayPartSelection)
            temp.morning = state
            temp.morningStart = start
            temp.morningEnd = end
            dayPartSelection = try JSONEncoder().encode(temp)
        } catch {
            print(error)
        }
    }
    
    func setDayPart(_ state: Bool, start: Int = 12, end: Int = 17) {
        do {
            var temp = try JSONDecoder().decode(DayPartData.self, from: dayPartSelection)
            temp.day = state
            temp.dayStart = start
            temp.dayEnd = end
            dayPartSelection = try JSONEncoder().encode(temp)
        } catch {
            print(error)
        }
    }
    
    func setEveningPart(_ state: Bool, start: Int = 18, end: Int = 23) {
        do {
            var temp = try JSONDecoder().decode(DayPartData.self, from: dayPartSelection)
            temp.evening = state
            temp.eveningStart = start
            temp.eveningEnd = end
            dayPartSelection = try JSONEncoder().encode(temp)
        } catch {
            print(error)
        }
    }
    
    func setNightPart(_ state: Bool, start: Int = 0, end: Int = 3) {
        do {
            var temp = try JSONDecoder().decode(DayPartData.self, from: dayPartSelection)
            temp.night = state
            temp.nightStart = start
            temp.nightEnd = end
            dayPartSelection = try JSONEncoder().encode(temp)
        } catch {
            print(error)
        }
    }
    
    func getDayPartSelection() -> DayPartData {
        do {
            return try JSONDecoder().decode(DayPartData.self, from: dayPartSelection)
        } catch {
            return .empty
        }
    }
}

struct DayPartData: Codable {
    
    var morning: Bool
    var morningStart: Int = 4
    var morningEnd: Int = 11
    var day: Bool
    var dayStart: Int = 12
    var dayEnd: Int = 17
    var evening: Bool
    var eveningStart: Int = 18
    var eveningEnd: Int = 23
    var night: Bool
    var nightStart: Int = 0
    var nightEnd: Int = 3
    
    enum CodingKeys: String, CodingKey {
        case morning = "morning"
        case morningStart = "morning_start"
        case morningEnd = "morning_end"
        case day = "day"
        case dayStart = "day_start"
        case dayEnd = "day_end"
        case evening = "evening"
        case eveningStart = "evening_start"
        case eveningEnd = "evening_end"
        case night = "night"
        case nightStart = "night_start"
        case nightEnd = "night_end"
    }
    
    static let empty = DayPartData(morning: true, day: true, evening: true, night: true)
    
    static func initialValue() -> Data {
        do {
            return try JSONEncoder().encode(DayPartData.empty)
        } catch {
            return Data()
        }
    }
}

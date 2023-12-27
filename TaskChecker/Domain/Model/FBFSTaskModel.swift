//
//  FBFSTaskModel.swift
//  TaskChecker
//
//  Created by admin on 26.12.2023.
//

import Foundation

struct FBFSTaskModel: Codable {
    let id: String
    let title: String
    let timeInterval: String
    let dayPart: String
    let note: String
    let initialDate: String
    let priority: String
    let color: String
    let notificationId: String
    let groupId: String
    let status: String

    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case timeInterval = "time_interval"
        case dayPart = "day_part"
        case note = "note"
        case initialDate = "initial_date"
        case priority = "priority"
        case color = "color"
        case notificationId = "notification_id"
        case groupId = "group_id"
        case status = "status"
    }
}

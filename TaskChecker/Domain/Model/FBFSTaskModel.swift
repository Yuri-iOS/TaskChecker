//
//  FBFSTaskModel.swift
//  TaskChecker
//
//  Created by admin on 26.12.2023.
//

import Foundation

struct FBFSTaskModel: Codable {
    let id: String?
    let notificationId: String?
    let groupId: String?
    let title: String?
    let note: String?
    let dayPart: String?
    let initialDate: String?
    let priority: String?
    let color: String?
    let status: String?
    let notificationTime: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case notificationId = "notification_id"
        case groupId = "group_id"
        case title = "title"
        case note = "note"
        case dayPart = "day_part"
        case initialDate = "initial_date"
        case priority = "priority"
        case color = "color"
        case status = "status"
        case notificationTime = "notification_time"
    }
}

enum TaskStatus: String {
    case initial, delivered, canceled, unknown
    
    var value: String {
        switch self {
        case .initial:
            return "initial"
        case .delivered:
            return "delivered"
        case .canceled:
            return "canceled"
        case .unknown:
            return "unknown"
        }
    }
    
    static func getStatus(_ s: String) -> Self {
        switch s {
        case "initial":
            return .initial
        case "delivered":
            return .delivered
        case "canceled":
            return .canceled
        default:
            return .unknown
        }
    }
}

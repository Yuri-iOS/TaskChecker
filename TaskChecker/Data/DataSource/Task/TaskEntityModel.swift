//
//  TaskEnityModel.swift
//  TaskChecker
//
//  Created by admin on 26.12.2023.
//

import Foundation

struct TaskEntityModel {
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
}

struct TaskMapper: DomainMapper {
    static let shared = TaskMapper()
    private init() {}
    
    typealias V = FBFSTaskModel
    
    typealias DomainModel = TaskEntityModel
    
    func mapToDomainModel(_ entity: FBFSTaskModel) -> TaskEntityModel {
        return TaskEntityModel(
            id: entity.id,
            notificationId: entity.notificationId,
            groupId: entity.groupId,
            title: entity.title,
            note: entity.note,
            dayPart: entity.dayPart,
            initialDate: entity.initialDate,
            priority: entity.priority,
            color: entity.color,
            status: entity.status,
            notificationTime: entity.notificationTime
        )
    }
    
    func mapToV(_ entity: TaskEntityModel) -> FBFSTaskModel {
        return FBFSTaskModel(
            id: entity.id,
            notificationId: entity.notificationId,
            groupId: entity.groupId,
            title: entity.title,
            note: entity.note,
            dayPart: entity.dayPart,
            initialDate: entity.initialDate,
            priority: entity.priority,
            color: entity.color,
            status: entity.status,
            notificationTime: entity.notificationTime
        )
    }
}

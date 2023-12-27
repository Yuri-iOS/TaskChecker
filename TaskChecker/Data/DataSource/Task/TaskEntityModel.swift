//
//  TaskEnityModel.swift
//  TaskChecker
//
//  Created by admin on 26.12.2023.
//

import Foundation

struct TaskEntityModel {
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
}

struct TaskMapper: DomainMapper {
    static let shared = TaskMapper()
    private init() {}
    
    typealias V = FBFSTaskModel
    
    typealias DomainModel = TaskEntityModel
    
    func mapToDomainModel(_ entity: FBFSTaskModel) -> TaskEntityModel {
        return TaskEntityModel(
            id: entity.id,
            title: entity.title,
            timeInterval: entity.timeInterval,
            dayPart: entity.dayPart,
            note: entity.note,
            initialDate: entity.initialDate,
            priority: entity.priority,
            color: entity.color,
            notificationId: entity.notificationId,
            groupId: entity.groupId,
            status: entity.status
        )
    }
    
    func mapToV(_ entity: TaskEntityModel) -> FBFSTaskModel {
        return FBFSTaskModel(
            id: entity.id,
            title: entity.title,
            timeInterval: entity.timeInterval,
            dayPart: entity.dayPart,
            note: entity.note,
            initialDate: entity.initialDate,
            priority: entity.priority,
            color: entity.color,
            notificationId: entity.notificationId,
            groupId: entity.groupId,
            status: entity.status
        )
    }
}

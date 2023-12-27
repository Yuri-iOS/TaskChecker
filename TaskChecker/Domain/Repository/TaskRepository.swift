//
//  TaskRepository.swift
//  TaskChecker
//
//  Created by admin on 26.12.2023.
//

import Foundation

protocol TaskRepository {
    func addTask(userId: String, from data: TaskEntityModel, completion: @escaping (Error?) -> Void) async
    
    func readTask(documentId: String) async
    
    func readAllTasks(userId: String, completion: @escaping (Error?) -> Void) async
}

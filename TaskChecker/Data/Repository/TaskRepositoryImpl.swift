//
//  TaskRepositoryImpl.swift
//  TaskChecker
//
//  Created by admin on 26.12.2023.
//

import SwiftUI
import FirebaseFirestore

final class TaskRepositoryImpl: ObservableObject, TaskRepository {
    
    let db = Firestore.firestore()
    let taskMapper = TaskMapper.shared
    
    @Published var array: [TaskEntityModel] = []
    @Published var historyArray: [TaskEntityModel] = []
    
    func addTask(userId: String, from data: TaskEntityModel, completion: @escaping (Error?) -> Void) async {
        do {
            try db
                .collection("user")
                .document(userId)
                .collection("date_task")
                .document(data.initialDate ?? "")
                .collection("all_tasks")
                .document(data.id ?? "")
                .setData(from: taskMapper.mapToV(data))
            completion(nil)
        } catch {
            completion(error)
        }
    }
    
    func readTask(documentId: String) async {
        DispatchQueue.main.sync {
            self.array = []
        }
        
        do {
            let snapshot = try await db.collection("task").getDocuments()
            let temp = snapshot.documents.first(where: { $0.documentID == documentId })
            guard let dataString = temp?.data() else {
                return
            }
            let jsonData = try JSONSerialization.data(withJSONObject: dataString)
            let result = try JSONDecoder().decode(FBFSTaskModel.self, from: jsonData)
            DispatchQueue.main.async { [self] in
                array.append(taskMapper.mapToDomainModel(result))
            }
            
        } catch {
            print(" JOPPPAAAA", error)
        }
    }
    
    func readAllTasksByDate(userId: String, date: String, completion: @escaping (Error?) -> Void) async {
        DispatchQueue.main.sync {
            self.array = []
        }
        do {
            let snapshot = try await db
                .collection("user")
                .document(userId)
                .collection("date_task")
                .document(date)
                .collection("all_tasks")
                .getDocuments()
            
            for document in snapshot.documents {
                let jsonData = try JSONSerialization.data(withJSONObject: document.data())
                let result = try JSONDecoder().decode(FBFSTaskModel.self, from: jsonData)
                DispatchQueue.main.async {
                    self.array.append(self.taskMapper.mapToDomainModel(result))
                }
            }
            completion(nil)
        } catch {
            print(error)
            completion(error)
        }
    }
    
    func readAllTasks(userId: String, completion: @escaping (Error?) -> Void) async {
        DispatchQueue.main.sync {
            self.array = []
        }
        do {
            let datesSnapshot = try await db
                .collection("user")
                .document(userId)
                .collection("date_task")
                .getDocuments()
            for task in datesSnapshot.documents {
                
            }
//            let allTasksSnapshot =
//            let mainCollection = db.collection("user")
//            let mainDocument = mainCollection.document(userId)
//            let snapshot = try await mainDocument.collection("task").getDocuments()
//            for document in snapshot.documents {
//                let jsonData = try JSONSerialization.data(withJSONObject: document.data())
//                let result = try JSONDecoder().decode(FBFSTaskModel.self, from: jsonData)
//                DispatchQueue.main.async {
//                    self.array.append(self.taskMapper.mapToDomainModel(result))
//                }
//            }
            completion(nil)
        } catch {
            completion(error)
        }
    }
    
    
}

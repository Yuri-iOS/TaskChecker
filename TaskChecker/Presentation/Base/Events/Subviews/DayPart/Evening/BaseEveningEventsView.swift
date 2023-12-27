//
//  BaseEveningEventsView.swift
//  TaskChecker
//
//  Created by admin on 22.12.2023.
//

import SwiftUI

struct BaseEveningEventsView: View {
    @EnvironmentObject var eventsModel: BaseEventsModel
    @StateObject var eveningModel = BaseEveningEventsModel()
    @EnvironmentObject var authRepository: AuthRepositoryImpl
    @EnvironmentObject var taskRepository: TaskRepositoryImpl
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea(.all)
            VStack {
                ForEach(taskRepository.array.filter({ $0.dayPart == PickerDestination.evening.value}), id: \.id) { task in
                    Text(task.dayPart)
                    Text(task.title)
                    Text(task.timeInterval)
                }
            }
        }
    }
}

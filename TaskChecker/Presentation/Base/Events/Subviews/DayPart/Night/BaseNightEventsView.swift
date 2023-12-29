//
//  BaseNightEventsView.swift
//  TaskChecker
//
//  Created by admin on 22.12.2023.
//

import SwiftUI

struct BaseNightEventsView: View {
    @EnvironmentObject var eventsModel: BaseEventsModel
    @StateObject var nightModel = BaseNightEventsModel()
    @EnvironmentObject var authRepository: AuthRepositoryImpl
    @EnvironmentObject var taskRepository: TaskRepositoryImpl
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea(.all)
            ScrollView {
                ForEach(taskRepository.array.filter({ $0.dayPart == PickerDestination.night.value}), id: \.id) { task in
                    TaskCardView(data: task)
                }
            }
        }
    }
}

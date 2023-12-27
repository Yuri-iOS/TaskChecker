//
//  BaseEventsNewEventView.swift
//  TaskChecker
//
//  Created by admin on 22.12.2023.
//

import SwiftUI

struct BaseEventsNewEventView: View {
    @EnvironmentObject var taskRepository: TaskRepositoryImpl
    @EnvironmentObject var authRepository: AuthRepositoryImpl
    @StateObject var newEventModel = BaseEventsNewEventModel()
    @EnvironmentObject var eventsModel: BaseEventsModel
    @Environment(\.dismiss) var dismiss
    @State var date = Date.now
    //    @State var dayParts = DayPartStorageManager.shared.getDayPartSelection().day
    var body: some View {
        ZStack {
            Color.teal.ignoresSafeArea(.all)
            ScrollView {
    
//                HStack {
                    DatePicker("", selection: $date)
                        .datePickerStyle(WheelDatePickerStyle())
                        .labelsHidden()
                        .padding(.horizontal)
//                    Spacer()
//                }
                VStack {
                    HStack {
                        Text("Day part")
                        Spacer()
                        Picker("", selection: $eventsModel.pickerState) {
                            ForEach(PickerDestination.allCases, id: \.self) { part in
                                pickerPart(by: part)
                            }
                        }
                    }

                    TextField("title", text: $newEventModel.title)
                    TextField("t i", text: $newEventModel.timeInterval)
                    Button(action: {
                        Task {
                            await createTask()
                        }
                    }, label: {
                        Text("add")
                    })
                }.padding(.horizontal, 32)

            }
        }
    }
    
    @ViewBuilder private func pickerPart(by part: PickerDestination) -> some View {
        switch part {
        case .morning:
            if eventsModel.dayPartData.morning {
                Text(String(localized: part.nameOfPart))
                    .tag(part)
            }
        case .day:
            if eventsModel.dayPartData.day {
                Text(String(localized: part.nameOfPart))
                    .tag(part)
            }
        case .evening:
            if eventsModel.dayPartData.evening {
                Text(String(localized: part.nameOfPart))
                    .tag(part)
            }
        case .night:
            if eventsModel.dayPartData.night {
                Text(String(localized: part.nameOfPart))
                    .tag(part)
            }
        }
    }
    
    private func createTask() async {
        await taskRepository.addTask(
            userId: authRepository.user?.uid ?? "",
            from: TaskEntityModel(
                id: String(Date().millisecondsSince1970),
                title: newEventModel.title,
                timeInterval: newEventModel.timeInterval,
                dayPart: eventsModel.pickerState.value,
                note: "",
                initialDate: "",
                priority: "",
                color: "",
                notificationId: "",
                groupId: "",
                status: ""
            ),
            completion: { error in
                if error == nil {
                    eventsModel.setLoadingState()
                    DispatchQueue.main.async {
                        Task {
                            await taskRepository.readAllTasks(userId: authRepository.user?.uid ?? "") { error in
                                if error == nil {
                                    eventsModel.setSuccessState()
                                } else {
                                    eventsModel.setErrorState(error)
                                }
                            }
                        }
                        NotificationService.shared.setReminder(date, subtitle: "jojoj", isRepeat: false, identifier: UUID().uuidString)
                        dismiss()
                    }
                } else {
                    newEventModel.setError(error?.localizedDescription ?? "unknown error")
                }
            })
    }
}

struct BaseEventsNewEventFieldView: View {
    @Binding var text: String
    let placeholder: String
    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .foregroundStyle(.black)
            .background(RoundedRectangle(cornerRadius: 16).fill(Color.orange))
            .padding(.horizontal)
    }
}

#Preview {
    BaseEventsNewEventView()
        .environmentObject(TaskRepositoryImpl())
        .environmentObject(AuthRepositoryImpl())
        .environmentObject(BaseEventsModel())
}

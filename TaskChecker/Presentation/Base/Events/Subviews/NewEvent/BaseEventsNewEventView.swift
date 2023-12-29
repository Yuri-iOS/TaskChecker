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
                    TextField("note", text: $newEventModel.note)
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
        eventsModel.createIdentifier()
        //        let id = String(Date().millisecondsSince1970)
        await taskRepository.addTask(
            userId: authRepository.user?.uid ?? "",
            from: TaskEntityModel(
                id: eventsModel.identifier,
                notificationId: eventsModel.identifier,
                groupId: "",
                title: newEventModel.title,
                note: newEventModel.note,
                dayPart: eventsModel.pickerState.value,
                initialDate: Date().currentDateFormatted,
                priority: "",
                color: "",
                status: "",
                notificationTime: date.selectedTimeFormatted
            ),
            completion: { error in
                if error == nil {
                    eventsModel.setLoadingState()
                    Task {
                        await taskRepository.readAllTasksByDate(userId: authRepository.user?.uid ?? "", date: Date().currentDateFormatted) { error in
                            if error == nil {
                                eventsModel.setSuccessState()
                                NotificationService.shared.setReminder(date, subtitle: newEventModel.title, isRepeat: false, identifier: eventsModel.identifier)
                                DispatchQueue.main.async {
                                    dismiss()
                                }
                                
                            } else {
                                eventsModel.setErrorState(error)
                            }
                        }
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

//#Preview {
//    BaseEventsNewEventView()
//        .environmentObject(TaskRepositoryImpl())
//        .environmentObject(AuthRepositoryImpl())
//        .environmentObject(BaseEventsModel())
//}

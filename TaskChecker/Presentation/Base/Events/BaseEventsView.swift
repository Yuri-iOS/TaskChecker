//
//  BaseEventsView.swift
//  TaskChecker
//
//  Created by admin on 21.12.2023.
//

import SwiftUI
import CoreLocation

struct BaseEventsView: View {
    @EnvironmentObject var eventsModel: BaseEventsModel
    @EnvironmentObject var authRepository: AuthRepositoryImpl
    @EnvironmentObject var taskRepository: TaskRepositoryImpl
    @StateObject var eventsSettingsModel = BaseEventsSettingsModel()
    @State private var firstAppear = false
    
    var body: some View {
        ZStack {
            Color.blueMain.ignoresSafeArea(.all)
            VStack(spacing: 0) {
                HStack {
                    Button(action: {
                        NotificationService.shared.removeNotification(identifier: eventsModel.identifier)
                    }, label: {
                        Text("remove \(eventsModel.identifier)")
                    })
                    Spacer()
                    Button(action: {
                        eventsModel.settingsPresented.toggle()
                    }, label: {
                        Image(systemName: "gearshape.fill")
                    })
                    .buttonStyle(.plain)
                    .padding(.horizontal)
                    .padding(.bottom, 8)
                }
                Picker("", selection: $eventsModel.pickerState) {
                    ForEach(PickerDestination.allCases, id: \.self) { part in
                        pickerPart(by: part)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                TabView(selection: $eventsModel.pickerState) {
                    Group {
                        if eventsModel.dayPartData.morning {
                            BaseMorningEventsView().tag(PickerDestination.morning)
                        }
                        if eventsModel.dayPartData.day {
                            BaseDayEventsView().tag(PickerDestination.day)
                        }
                        if eventsModel.dayPartData.evening {
                            BaseEveningEventsView().tag(PickerDestination.evening)
                        }
                        if eventsModel.dayPartData.night {
                            BaseNightEventsView().tag(PickerDestination.night)
                        }
                        
                    }.environmentObject(eventsModel)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
            }
        }
        .sheet(isPresented: $eventsModel.settingsPresented, content: {
            BaseEventsSettingsView()
                .environmentObject(eventsSettingsModel)
        })
        .sheet(isPresented: $eventsModel.newEventPresented, content: {
            BaseEventsNewEventView()
        })
        .onAppear {
            if !firstAppear {
                eventsModel.setLoadingState()
                Task {
                    await taskRepository.readAllTasksByDate(userId: authRepository.user?.uid ?? "", date: Date().currentDateFormatted) { error in
                        if error == nil {
                            self.eventsModel.setSuccessState()
                        } else {
                            self.eventsModel.setErrorState(error)
                        }
                    }
                }
                firstAppear = true
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
}

//#Preview {
//    BaseEventsView()
//}

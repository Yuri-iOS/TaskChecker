//
//  BaseEventsSettingsView.swift
//  TaskChecker
//
//  Created by admin on 22.12.2023.
//

import SwiftUI

struct BaseEventsSettingsView: View {
    @EnvironmentObject var settingsModel: BaseEventsSettingsModel
    @EnvironmentObject var eventsModel: BaseEventsModel
    var body: some View {
        ZStack {
            VStack {
                switch settingsModel.settingsState {
                case .main:
                    Form {
                        Section(content: {
                            selectPart(name: String(localized: "morning")) {
                                settingsModel.setSettingsState(.morning)
                            }
                            selectPart(name: String(localized: "day")) {
                                settingsModel.setSettingsState(.day)
                            }
                            selectPart(name: String(localized: "evening")) {
                                settingsModel.setSettingsState(.evening)
                            }
                            selectPart(name: String(localized: "night")) {
                                settingsModel.setSettingsState(.night)
                            }
                        }, header: {
                            HStack {
                                Text("Part of the day settings")
                                    .foregroundStyle(.white)
                                    .font(.footnote)
                                Spacer()
                            }
                        })
                    }
                case .morning:
                    DayPartSettingsItemView(
                        name: String(localized: "morning"),
                        activeState: $settingsModel.mornigActiveState,
                        start: $settingsModel.morningStart,
                        end: $settingsModel.morningEnd) {
                            settingsModel.setMorningData()
                        }
                case .day:
                    DayPartSettingsItemView(
                        name: String(localized: "day"),
                        activeState: $settingsModel.dayActiveState,
                        start: $settingsModel.dayStart,
                        end: $settingsModel.dayEnd) {
                            settingsModel.setDayData()
                        }
                case .evening:
                    DayPartSettingsItemView(
                        name: String(localized: "evening"),
                        activeState: $settingsModel.eveningActiveState,
                        start: $settingsModel.eveningStart,
                        end: $settingsModel.eveningEnd) {
                            settingsModel.setEveningData()
                        }
                case .night:
                    DayPartSettingsItemView(
                        name: String(localized: "night"),
                        activeState: $settingsModel.nightActiveState,
                        start: $settingsModel.nightStart,
                        end: $settingsModel.nightEnd) {
                            settingsModel.setNightData()
                        }
                }
//                Form {

//                }
            }
            .environmentObject(settingsModel)
            .environmentObject(eventsModel)
        }
        .onDisappear {
            settingsModel.setSettingsState(.main)
        }
    }
    
    @ViewBuilder private func selectPart(name: String, action: @escaping () -> Void) -> some View {
        Button(action: {
            action()
        }, label: {
            HStack {
                Text(name)
                Spacer()
                Image(systemName: "chevron.right")
            }
        })
    }
}

struct DayPartSettingsItemView: View {
    let name: String
    @Binding var activeState: Bool
    @Binding var start: Int
    @Binding var end: Int
    let completion: () -> Void
    @EnvironmentObject var eventsModel: BaseEventsModel
    @EnvironmentObject var settingsModel: BaseEventsSettingsModel
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                completion()
                eventsModel.refreshDayPartData()
                settingsModel.setSettingsState(.main)
            }, label: {
                Text("back")
            })
            Toggle(name, isOn: $activeState).onChange(of: activeState) { _ in
                completion()
                eventsModel.refreshDayPartData()
            }
            if activeState {
                HStack {
                    VStack {
                        Text("Start")
                        changeTimeButton(value: $start)
                    }
                    VStack {
                        Text("End")
                        changeTimeButton(value: $end)
                    }
                }
            }
        }

    }
    
    @ViewBuilder private func changeTimeButton(value: Binding<Int>) -> some View {
        HStack {
            Button(action: {
                settingsModel.reduceTime(value)
                print(value.wrappedValue)
            }, label: {
                Text("-")
            })
            Text("\(value.wrappedValue)")
            Button(action: {
                settingsModel.increaseTime(value)
                print(value.wrappedValue)
            }, label: {
                Text("+")
            })
        }
    }
}

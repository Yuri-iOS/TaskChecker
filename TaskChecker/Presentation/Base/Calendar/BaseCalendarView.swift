//
//  BaseCalendarView.swift
//  TaskChecker
//
//  Created by admin on 21.12.2023.
//

import SwiftUI

struct BaseCalendarView: View {
    var body: some View {
        ZStack {
            Color.teal.ignoresSafeArea(.all)
            VStack {
                ScrollView {
                    ForEach(0..<45) { i in
                        Text("\(i)")
                    }
                }
            }
        }
        .onAppear {
            print("BaseCalendarView")
        }
    }
}

#Preview {
    BaseCalendarView()
}

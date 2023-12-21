//
//  BaseAllEventsView.swift
//  TaskChecker
//
//  Created by admin on 21.12.2023.
//

import SwiftUI

struct BaseAllEventsView: View {
    var body: some View {
        ZStack {
            Color.purple.ignoresSafeArea(.all)
            VStack {
                ScrollView {
                    ForEach(0..<45) { i in
                        Text("\(i)")
                    }
                }
            }
        }
        .onAppear {
            print("BaseAllEventsView")
        }
    }
}

//#Preview {
//    BaseAllEventsView()
//}

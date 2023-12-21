//
//  BaseEventsView.swift
//  TaskChecker
//
//  Created by admin on 21.12.2023.
//

import SwiftUI

struct BaseEventsView: View {
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea(.all)
            VStack {
                ScrollView {
                    ForEach(0..<45) { i in
                        Text("\(i)")
                    }
                }
            }
        }
        .onAppear {
            print("BaseEventsView")
        }

    }
}

//#Preview {
//    BaseEventsView()
//}

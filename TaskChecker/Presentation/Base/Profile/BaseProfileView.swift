//
//  BaseProfileView.swift
//  TaskChecker
//
//  Created by admin on 21.12.2023.
//

import SwiftUI

struct BaseProfileView: View {
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea(.all)
            VStack {
                ScrollView {
                    ForEach(0..<45) { i in
                        Text("\(i)")
                    }
                }
            }
        }
        .onAppear {
            print("BaseProfileView")
        }
    }
}

#Preview {
    BaseProfileView()
}

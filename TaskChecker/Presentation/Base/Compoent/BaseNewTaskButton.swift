//
//  BaseNewTaskButton.swift
//  TaskChecker
//
//  Created by admin on 22.12.2023.
//

import SwiftUI

struct BaseNewTaskButton: View {
    let completion: () -> Void
    var body: some View {
        Button(action: {
            completion()
        }, label: {
            Image(systemName: "plus")
                .frame(width: 50, height: 50)
                .foregroundStyle(.white)
                .font(.system(size: 24).weight(.black))
                .background(Color.teal)
                .clipShape(Circle())
                .shadow(color: .black, radius: 1, y: 1)
        })
        .padding(.bottom, 35)
    }
}

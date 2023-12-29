//
//  TaskCardView.swift
//  TaskChecker
//
//  Created by admin on 29.12.2023.
//

import SwiftUI

struct TaskCardView: View {
    let data: TaskEntityModel
    @State private var cancelPresented = false
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(unwrapString(data.title))
                        
                    Spacer()
                    
                    Button(action: {
                        cancelPresented.toggle()
                    }, label: {
                        Image(systemName: "xmark")
                    })
                }
                Text(unwrapString(data.note))
                Text(unwrapString(data.initialDate))
            }
            .foregroundStyle(.white)
            .padding(.horizontal)
            .padding(.vertical, 3)
        }
        .frame(maxWidth: .infinity)
        .background(RoundedRectangle(cornerRadius: 16).fill(Color.orange))
        .padding(.horizontal)
        .padding(.top, 8)
        .alert("Remove alert?", isPresented: $cancelPresented, actions: {
            Button(action: {
                NotificationService.shared.removeNotification(identifier: data.notificationId ?? "")
            }, label: {
                Text("Ok")
            })
            Button(role: .cancel, action: {
                cancelPresented.toggle()
            }, label: {
                Text("Cancel")
            })
        })
    }
    
    private func unwrapString(_ s: String?) -> String {
        guard let str = s else {
            return "-"
        }
        return str
    }
}

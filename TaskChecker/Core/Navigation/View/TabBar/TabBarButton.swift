//
//  TabBarButton.swift
//  TaskChecker
//
//  Created by admin on 21.12.2023.
//

import SwiftUI

struct TabBarButton: View {
    let image: String
    let text: String
    let index: ScreenRouteDestination
    @Binding var selection: ScreenRouteDestination
    
    var isSelected: Bool {
        withAnimation {
            index == selection
        }
        
    }
    
    var body: some View {
        Button(action: {
            selection = index
        }, label: {
            VStack {
                Image(systemName: image)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.top, 12)
                
                    Text(text)
                    .font(.footnote)
                    
            }.foregroundColor(.white)
//
                
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(isSelected ? Color.blue : Color.gray)
//        .padding(.bottom, 24)
        
    }
}

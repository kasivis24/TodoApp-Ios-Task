//
//  BottomSheet.swift
//  Todo-App-Task
//
//  Created by Kasivishwanathan M on 04/12/25.
//

import SwiftUI

struct BottomSheet<Content: View>: View {
    @Binding var showSheet: Bool
    let content: () -> Content 
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 0) {
                Capsule()
                    .fill(Color.gray)
                    .frame(width: 40, height: 6)
                    .padding(.top, 10)
                content()
                    .padding()
                    .padding(.vertical, 80)
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 10)
            .offset(y: showSheet ? 0 : UIScreen.main.bounds.height)
            .animation(.spring(), value: showSheet)
            
        }
        .ignoresSafeArea()
    }

}

/*
struct BottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheet()
    }
}*/

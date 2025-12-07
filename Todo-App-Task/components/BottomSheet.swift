//
//  BottomSheet.swift
//  Todo-App-Task
//
//  Created by Kasivishwanathan M on 04/12/25.
//

import SwiftUI

struct BottomSheet<Content: View>: View {
    
    @Binding var showSheet: Bool
    let size : BottomSheetSize
    let searchViewModel : SearchViewModel
    let content: () -> Content

    
    var body: some View {
        
        ZStack (alignment : .bottom){
            Color.black.opacity(0.7)
                .onTapGesture {
                    showSheet = false
                }
            
            
            VStack {
                
                VStack(spacing: 0) {
                    ScrollView {
                    
                        content()
                            .padding()
                                    
                    }
                }
                .frame(maxWidth: .infinity,maxHeight : size.height)
                //.cornerRadius(10,corners: [.topLeft,.topRight])
                //.shadow(radius: 10)
                .animation(.spring(), value: showSheet)

            }

            
            
        }
        .frame(alignment : .bottom)

    }

}

/*
struct BottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheet()
    }
}*/

//
//  DatePickerDialog.swift
//  Todo-App-Task
//
//  Created by Kasivishwanathan M on 05/12/25.
//

import Foundation
import SwiftUI
struct DatePickerDialog: View {
    @Binding var isPresented: Bool
    @Binding var selectedDate: Date
    @Binding var isDateChosen: Bool
    var title: String = "Select Date"
    
    var body: some View {
        ZStack {
            
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture {
                    isPresented = false
                }
            VStack(spacing: 15) {
                Text(title)
                    .font(.headline)
                    .padding(.top)
                Divider()
                DatePicker(
                    "",
                    selection: $selectedDate,
                    displayedComponents: [.date]
                )
                .datePickerStyle(CompactDatePickerStyle())
                .labelsHidden()
                .frame(maxWidth: .infinity)
                Divider()
                HStack {
                    Button("Cancel") {
                        isPresented = false
                        isDateChosen = false
                    }
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity)
                    Divider().frame(height: 44)
                    Button("Done") {
                        isPresented = false
                        isDateChosen = true
                    }
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity)
                }
                .frame(height: 50)
            }
            .padding(.bottom, 10)
            .frame(width: 330)
            .background(Color.white)
            .cornerRadius(20)            
            .shadow(color: .black.opacity(0.3), radius: 15, x: 0, y: 8)
            .transition(.scale)
            .animation(.spring(), value: isPresented)
        }
    }
}
/*
struct DatePickerDialogView_Previews: PreviewProvider {
    
    @State private var showDialog = true
    @State private var date = Date()
    
    static var previews: some View {
        DatePickerDialog(isPresented: $showDialog, selectedDate: $date)
    }
}*/

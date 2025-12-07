//
//  FilterView.swift
//  Todo-App-Task
//
//  Created by Kasivishwanathan M on 05/12/25.
//

import SwiftUI
struct FilterView: View {
    @State private var selectedCategory: String = "Work"
    @State private var selectedDueDate: String = "Upcoming"
    @State private var selectedPriority: String = "Medium"
    
    
    @Binding var filterDateDialog : Bool
    @Binding var selectedDate : Date
    @Binding var filterDialog : Bool
    @Binding var isDateChosen: Bool

    let viewModel : SearchViewModel

    
    var body: some View {
        VStack(spacing: 20) {
            Capsule()
                .fill(Color.gray)
                .frame(width: 40, height: 6)
                .padding(.top, 10)
            
            Text("Filters")
                .font(.title2)
                .fontWeight(.bold)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Category")
                    .font(.headline)
                    .frame(maxWidth : .infinity,alignment: .leading)
                
                HStack(spacing: 20) {
                    filterButton(title: "Work", selectedValue: $selectedCategory)
                    filterButton(title: "Personal", selectedValue: $selectedCategory)
                    filterButton(title: "Others", selectedValue: $selectedCategory)
                }
                .frame(maxWidth : .infinity)
                .padding()
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Due Date")
                    .font(.headline)
                
                HStack (spacing : 10){
                    filterButton(title: "Today", selectedValue: $selectedDueDate)
                    filterButton(title: "Upcoming", selectedValue: $selectedDueDate)
                    filterButton(title: "Overdue", selectedValue: $selectedDueDate)
                    filterButton(title: "No Date", selectedValue: $selectedDueDate)
                    
                }
                .frame(maxWidth : .infinity)
                .padding()
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Priority")
                    .font(.headline)
                    .frame(maxWidth : .infinity,alignment: .leading)
                HStack(spacing: 20) {
                    priorityButton(title: "High", color: .red, selectedValue: $selectedPriority)
                    priorityButton(title: "Medium", color: .yellow, selectedValue: $selectedPriority)
                    priorityButton(title: "Low", color: .green, selectedValue: $selectedPriority)
                }
                .frame(maxWidth : .infinity)
                .padding()
            }
            
            HStack {
                Text("Date")
                    .font(.headline)
                 Spacer()
                
                Button (action : {
                    
                    filterDateDialog = !filterDateDialog
                    
                }){
                    Text(isDateChosen ? Utils.dateToString(selectedDate) : "Select date")
                        .foregroundColor(.blue)
                }
                
            }
            .frame(maxWidth : .infinity)
            
            Button(action: {
                filterDialog = !filterDialog
                applyFilters()
            }) {
                Text("Apply Filters")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
            }
            .padding(.horizontal)
            .padding(.top,50)
            Button(action: {
               clear()
            }) {
                Text("Clear Filters")
                    .foregroundColor(.blue)
                    .font(.headline)
            }
            .padding(.bottom)
        }
        .onAppear {
            loadInitialValues()
        }
        .padding(.horizontal)
        .background(Color(.systemBackground))
        .cornerRadius(18)
    }
    
    func loadInitialValues() {
        print("load init")
            selectedCategory = viewModel.selectedCategory
            selectedPriority = viewModel.selectedPriority
            selectedDueDate = viewModel.selectedDueFilter
        selectedDate = viewModel.selectedDate ?? Date()
        }
    
        // MARK: Apply to ViewModel
        func applyFilters() {
            print("apply filter")
            viewModel.selectedCategory = selectedCategory
            viewModel.selectedPriority = selectedPriority
            viewModel.selectedDueFilter = selectedDueDate
            viewModel.selectedDate = isDateChosen ? selectedDate : nil
            viewModel.applyFilters()
        }
        // MARK: Clear Filters
        func clear() {
            print("clear")
            selectedCategory = ""
            selectedPriority = ""
            selectedDueDate = ""
            selectedDate = Date()
            isDateChosen = false
            viewModel.clearFilters()
        }}

extension FilterView {
    func filterButton(title: String, selectedValue: Binding<String>) -> some View {
        Button(action: {
            selectedValue.wrappedValue = title
        }) {
            
            if selectedValue.wrappedValue == title {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.blue)
                    .frame(minWidth: 80, minHeight: 40)
                    .background(selectedValue.wrappedValue == title ? Color.blue.opacity(0.2) : Color.gray.opacity(0.2))
                    .cornerRadius(10)
                
            }else {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(Color.primary)
                    .frame(minWidth: 80, minHeight: 40)
                    .background(selectedValue.wrappedValue == title ? Color.blue.opacity(0.2) : Color.gray.opacity(0.2))
                    .cornerRadius(10)
                
            }

        }
    }
    
    func priorityButton(title: String, color: Color, selectedValue: Binding<String>) -> some View {
        Button(action: {
            selectedValue.wrappedValue = title
        }) {
            HStack(spacing: 5) {
                Image(systemName: "flag.fill")
                Text(title)
                    .font(.subheadline)
            }
            .foregroundColor(Color.primary)
            .frame(minWidth: 90, minHeight: 40)
            .background(selectedValue.wrappedValue == title ? color : Color.gray.opacity(0.2))
            .cornerRadius(10)
        }
    }
}
/*
struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}*/

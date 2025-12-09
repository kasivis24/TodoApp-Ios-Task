//
//  SearchViewModel.swift
//  Todo-App-Task
//
//  Created by Kasivishwanathan M on 06/12/25.
//

import Foundation

class SearchViewModel: ObservableObject {
    
    
    @Published var filteredTasks: [Task] = []
    @Published var searchText: String = ""
    @Published var selectedCategory: String = ""
    @Published var selectedPriority: String = ""
    @Published var selectedDate: Date? = nil
    @Published var selectedDueFilter: String = ""
    private let repository : Database = TaskRepository.shared
    
    @Published var tasks : [Task] = []
    
    
    func fetchAllTasks(onSuccess : ()-> Void,onFailure : ()-> Void){
        
        repository.fetchAllTasks(onSuccess: {taskList in
            
            self.tasks = taskList
            applyFilters()
            onSuccess()
            
        }, onFailed: {
            
            onFailure()
            
        })
        
    }
    
    
    func updateTask(taskModel : TaskModel,onSuccess : ()-> Void,onFailed : ()-> Void){
        
        print("view model Taskmodel Id from \(taskModel.id)")
        repository.updateTask(taskModel: taskModel,
                              onSuccess: {
                                onSuccess()
                              },
                              onFailed: {
                                onFailed()
                              }
        )

    }
    
    func deleteTask(taskId : UUID, onSuccess :@escaping ()-> Void,onFailed : ()-> Void){
        
        print("before call in viewmodel taskid \(taskId)")
        
        if let index = self.tasks.firstIndex(where: { $0.id == taskId }) {
            self.tasks.remove(at: index)
        }
        
        
        repository.deleteTask(
            taskId: taskId,
            onSuccess: {
                onSuccess()
            },
            onFailed: {
                onFailed()
            }
        )

        
    }
    func applyFilters() {
        filteredTasks = tasks
        
        print("filter list before  \(filteredTasks)")

       
        if !searchText.isEmpty {
            print("serachviewmodel -> search text")
            filteredTasks = filteredTasks.filter { task in
                task.title?.localizedCaseInsensitiveContains(searchText) ?? false
            }
        }
       
        if !selectedCategory.isEmpty {
            print("searchviewmodel-> selct catgory");            filteredTasks = filteredTasks.filter { $0.category == selectedCategory
                
            }
        }
      
        if !selectedPriority.isEmpty {
            print("searchviewmodle -> slecft piroity")
            filteredTasks = filteredTasks.filter { $0.priority == selectedPriority }
        }
      
        
        if let selectedDate = selectedDate {
            let targetDate = Calendar.current.startOfDay(for: selectedDate)
            print("🎯 Target StartOfDay:", targetDate)
            filteredTasks = filteredTasks.filter { task in
                guard let due = task.dueDate else { return false }
                let taskDay = Calendar.current.startOfDay(for: due)
                print("📌 Task Date:", taskDay)
                return taskDay == targetDate
            }
        }
        
      
        if selectedDueFilter == "Today" {
            print("serachviewmodlel -> slecct today")
            filteredTasks = filteredTasks.filter { Calendar.current.isDateInToday($0.dueDate ?? Date()) }
        } else if selectedDueFilter == "Upcoming" {
            print("serachviewmodlel -> upcomign today");          filteredTasks = filteredTasks.filter { ($0.dueDate ?? Date()) > Date() }
        } else if selectedDueFilter == "Overdue" {
            print("serachviewmodlel -> overdue today");            filteredTasks = filteredTasks.filter { ($0.dueDate ?? Date()) < Date() }
        } else if selectedDueFilter == "No Date" {
            print("serachviewmodlel -> no date ");            filteredTasks = filteredTasks.filter { $0.dueDate == nil }
        }
        
        filteredTasks.sort { ($0.dueDate ?? Date()) < ($1.dueDate ?? Date()) }
        
        print("Filter list \(filteredTasks)")    }
    
    
    
    
    func clearFilters() {
        selectedCategory = ""
        selectedPriority = ""
        selectedDate = nil
        selectedDueFilter = ""
        applyFilters()
    }
}

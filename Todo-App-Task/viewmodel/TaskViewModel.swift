//
//  TaskViewModel.swift
//  Todo-App-Task
//
//  Created by Kasivishwanathan M on 04/12/25.
//

import Foundation
class TaskViewModel : ObservableObject {
    
    private let repository : Database = TaskRepository.shared
    
    @Published var tasks : [Task] = []
    
    private var timer : Timer?
    
    init() {
        startOverdueTimer()
    }
    
    
    func addNewTask(taskModel : TaskModel,onSuccess : ()-> Void,onFailed : ()-> Void) {
        
        repository.saveTask(title : taskModel.title,description: taskModel.desc,dueDate: taskModel.dueDate,reminder: taskModel.reminder,priority: taskModel.priority,category: taskModel.category,isCompleted: taskModel.isCompleted,
                            thumnail: taskModel.thumnail,
                            onSuccess: {
                                onSuccess()
                            },
                            onFailed: {
                                onFailed()
                            }
        )
        
    }
    
    func fetchAllTasks(onSuccess : ()-> Void,onFailure : ()-> Void){
        
        repository.fetchAllTasks(onSuccess: {taskList in
            
            self.tasks = taskList
            
            self.tasks.forEach{task in
                print("Fetch Task adat -> \(task.isOverDue)")
            }
            
            print("Fteched lists \(self.tasks)")
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
    
    func startOverdueTimer() {
            timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { [weak self] _ in
                
                print("background task runnin ----->")
                self?.checkOverdueStatus()
            }
        }
    
        func checkOverdueStatus() {
            repository.updateOverdueTasks()
            tasks = repository.fetchAllTasks() 
        }
}

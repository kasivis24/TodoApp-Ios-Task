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
    
    
    func addNewTask(taskModel : TaskModel,onSuccess : ()-> Void,onFailed : ()-> Void) {
        
        repository.saveTask(title : taskModel.title,description: taskModel.desc,dueDate: taskModel.dueDate,reminder: taskModel.reminder,priority: taskModel.priority,category: taskModel.category,isCompleted: taskModel.isCompleted,
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
}

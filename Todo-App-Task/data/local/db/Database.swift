//
//  Database.swift
//  Todo-App-Task
//
//  Created by Kasivishwanathan M on 03/12/25.
//

import Foundation
protocol Database {
    func saveTask(
       title: String,
       description: String,
       dueDate: Date?,
       reminder: Bool,
       priority: String,
       category: String,
       isCompleted: Bool,
        thumnail : Data?,
        onSuccess : ()-> Void,
        onFailed : ()-> Void
    )
    
    func fetchAllTasks(onSuccess : ([Task])-> Void,onFailed : ()-> Void)
    
    func updateTask(taskModel : TaskModel, onSuccess : ()-> Void,onFailed : ()-> Void)
    
    func deleteTask(taskId : UUID,onSuccess : ()-> Void,onFailed : ()-> Void)
    
    func fetchAllTasks() -> [Task]
    
    func saveContext()
    
    func updateOverdueTasks()
    
}

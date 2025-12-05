//
//  TaskRepository.swift
//  Todo-App-Task
//
//  Created by Kasivishwanathan M on 03/12/25.
//

import Foundation
import CoreData

class TaskRepository: Database {

    
    
    
    static let shared = TaskRepository()
    private let context = PersistenceController.shared.container.viewContext
    private init() {}
    
    
    
    func saveTask(title: String, description: String, dueDate: Date?, reminder: Bool, priority: String, category: String, isCompleted: Bool,onSuccess : ()-> Void,onFailed : ()-> Void) {

        
        let entity = Task(context: context)
        entity.id = UUID()
            entity.title = title
            entity.desc = description
            entity.dueDate = dueDate
            entity.priority = priority
            entity.category = category
            entity.isCompleted = isCompleted
        entity.remainder = reminder
            do {
                try context.save()
                print("Saved Successfully")
                onSuccess()
            } catch {
                print("Save failed: \(error)")
                onFailed()
            }
        
    }
    
    func fetchAllTasks(onSuccess : ([Task])-> Void,onFailed : ()-> Void) {
            let request = NSFetchRequest<Task>(entityName: "Task")
            request.sortDescriptors = [NSSortDescriptor(key: "dueDate", ascending: true)]
            do {
                let list = try context.fetch(request)
                onSuccess(list)
            } catch {
                onFailed()
                print("Fetch Error: \(error.localizedDescription)")
            }
        
    }

    
    func updateTask(taskModel: TaskModel, onSuccess: () -> Void, onFailed: () -> Void) {
        
        
        let request: NSFetchRequest<Task> = Task.fetchRequest()
                request.predicate = NSPredicate(format: "id == %@", taskModel.id as CVarArg)
                
                do {
                    let tasks = try context.fetch(request)
                    if let task = tasks.first {
                        task.id = taskModel.id
                        task.title = taskModel.title
                        task.desc = taskModel.desc
                        task.priority = taskModel.priority
                        task.category = taskModel.category
                        task.dueDate = taskModel.dueDate
                        task.remainder = taskModel.reminder
                        task.isCompleted = taskModel.isCompleted
                        
                        try context.save()
                        onSuccess()
                    } else {
                        print("failed taskmodle Id \(taskModel.id)")
                        onFailed()
                    }
                } catch {
                    print("invaild")
                    onFailed()
                }
            }
    
    func deleteTask(taskId: UUID, onSuccess: () -> Void, onFailed: () -> Void) {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
                request.predicate = NSPredicate(format: "id == %@", taskId as CVarArg)
                do {
                    let tasks = try context.fetch(request)
                    if let task = tasks.first {
                        context.delete(task)
                        try context.save()
                        onSuccess()
                    } else {
                        onFailed()
                    }
                } catch {
                    print("Delete error: \(error.localizedDescription)")
                    onFailed()
                }
            }
}

    
    


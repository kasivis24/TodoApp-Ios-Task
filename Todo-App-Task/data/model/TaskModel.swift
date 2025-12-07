//
//  TaskModel.swift
//  Todo-App-Task
//
//  Created by Kasivishwanathan M on 04/12/25.
//

import Foundation

struct TaskModel {
    let id: UUID
    let title: String
    let desc: String
    let dueDate: Date
    let priority: String
    let category: String
    let isCompleted: Bool
    let reminder: Bool
    let thumnail : Data?
    let isOverDue : Bool
    init(
        id: UUID = UUID(),
        title: String,
        desc: String,
        dueDate: Date,
        priority: String,
        category: String,
        isCompleted: Bool = false,
        reminder: Bool = false,
        thumnail: Data? = nil,
        isOverDue: Bool = false
    ) {
        self.id = id
        self.title = title
        self.desc = desc
        self.dueDate = dueDate
        self.priority = priority
        self.category = category
        self.isCompleted = isCompleted
        self.reminder = reminder
        self.thumnail = thumnail
        self.isOverDue = isOverDue
    }
}

//
//  HomeViewModel.swift
//  Todo-App-Task
//
//  Created by Kasivishwanathan M on 07/12/25.
//

import Foundation
import SwiftUI
import CoreData

class HomeViewModel: ObservableObject {
    @Published var totalDueDate = 0
    @Published var completed = 0
    @Published var overDue = 0
    @Published var allTasks = 0
    @Published var highPercent: CGFloat = 0.0
    @Published var mediumPercent: CGFloat = 0.0
    @Published var lowPercent: CGFloat = 0.0
    @Published var upcomingTasks: [Task] = []
    private let repository: Database = TaskRepository.shared
    
    init() {
        updateData()
    }

    
    // MARK: - Fetch all data
    func updateData() {
        // Update overdue tasks first
        repository.updateOverdueTasks()
        // Fetch all tasks
        let tasks = repository.fetchAllTasks()
        allTasks = tasks.count
        completed = tasks.filter { $0.isCompleted }.count
        overDue = tasks.filter { $0.isOverDue }.count
        totalDueDate = tasks.filter { !$0.isCompleted && !$0.isOverDue }.count
        // Priority percentages
        let total = CGFloat(tasks.count)
        guard total > 0 else { return }
        highPercent = CGFloat(tasks.filter { $0.priority?.lowercased() == "high" }.count) / total
        mediumPercent = CGFloat(tasks.filter { $0.priority?.lowercased() == "medium" }.count) / total
        lowPercent = CGFloat(tasks.filter { $0.priority?.lowercased() == "low" }.count) / total
        // Upcoming tasks (max 5)
        print("percmnet -----> \(highPercent)  and 0  \(mediumPercent) and \(lowPercent)")
        upcomingTasks = Array(tasks.sorted {
            ($0.dueDate ?? Date()) < ($1.dueDate ?? Date())
        }.prefix(5))
    }
}

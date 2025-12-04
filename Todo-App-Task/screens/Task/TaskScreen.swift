//
//  TaskScreen.swift
//  Todo-App-Task
//
//  Created by Kasivishwanathan M on 03/12/25.
//

import SwiftUI

struct TaskScreen: View {
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading) {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack(spacing: 18) {
                                
                                TaskItem(
                                    title: "Design the new onboarding flow",
                                    due: "Today",
                                    category: "Work",
                                    categoryColor: Color.purple.opacity(0.2),
                                    categoryDotColor: .purple,
                                    progress: 0.25,
                                    completed: false
                                )
                                
                                TaskItem(
                                    title: "Finalize Q4 budget proposal",
                                    due: "Yesterday",
                                    category: "Work",
                                    categoryColor: Color.purple.opacity(0.2),
                                    categoryDotColor: .purple,
                                    progress: 1.0,
                                    completed: true
                                )
                                
                                TaskItem(
                                    title: "Schedule annual team offsite",
                                    due: "Tomorrow",
                                    category: "Personal",
                                    categoryColor: Color.green.opacity(0.2),
                                    categoryDotColor: .green,
                                    progress: 0.0,
                                    completed: false
                                )
                                
                                TaskItem(
                                    title: "Buy groceries for the week",
                                    due: "No due date",
                                    category: "Personal",
                                    categoryColor: Color.green.opacity(0.2),
                                    categoryDotColor: .green,
                                    progress: 0.75,
                                    completed: false
                                )
                                
                                TaskItem(
                                    title: "Respond to client emails",
                                    due: "Oct 28",
                                    category: "Urgent",
                                    categoryColor: Color.orange.opacity(0.2),
                                    categoryDotColor: .orange,
                                    progress: 0.50,
                                    completed: false
                                )
                            }
                            .padding(.bottom, 70)
                        }
                        
                        Spacer()
                    }
            
            .navigationTitle("MyTasks")
            .navigationBarItems(trailing: HStack {
                
                                    Image(systemName: "arrow.up.arrow.down")
                                        .font(.system(size: 18))
                                        .foregroundColor(.blue)
                
                
                                    Image(systemName: "arrow.up.arrow.down")
                                        .font(.system(size: 18))
                                        .foregroundColor(.blue)
            }
            )
            
        }
    }
}

struct TaskScreen_Previews: PreviewProvider {
    static var previews: some View {
        TaskScreen()
    }
}

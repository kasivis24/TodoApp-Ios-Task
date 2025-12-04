//
//  TaskItem.swift
//  Todo-App-Task
//
//  Created by Kasivishwanathan M on 03/12/25.
//

import SwiftUI

struct TaskItem: View {
    
    var title: String
    var due: String
    var category: String
    var categoryColor: Color
    var categoryDotColor: Color
    var progress: CGFloat
    var completed: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Circle()
                    .stroke(lineWidth: 2)
                    .fill(completed ? Color.blue : Color.gray.opacity(0.3))
                    .frame(width: 25, height: 25)
                
                Text(title)
                    .font(.custom(Fonts.PUVI_MEDIUM, size : 18))
                    .foregroundColor(completed ? .gray : .black)
                    .strikethrough(completed)
                
                Spacer()
                
                Image(systemName: "flag.fill")
                    .foregroundColor(.gray)
            }
            
            Text("Due: \(due)")
                .font(.custom(Fonts.PUVI_REGULAR, size: 18))
                .foregroundColor(.gray)
                .padding(.leading, 32)
            
            HStack {
                HStack(spacing: 6) {
                    Circle()
                        .fill(categoryDotColor)
                        .frame(width: 8, height: 8)
                    
                    Text(category)
                        .font(.caption)
                        .foregroundColor(categoryDotColor)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(categoryColor)
                .cornerRadius(12)
                
                Spacer()
                
                TaskProgressBar(progress: progress)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(18)
        .shadow(color: .gray.opacity(0.15), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
    }
}

struct TaskItem_Previews: PreviewProvider {
    static var previews: some View {
        TaskItem(
            title: "Respond to client emails",
                                    due: "Oct 28",
                                    category: "Urgent",
                                    categoryColor: Color.orange.opacity(0.2),
                                    categoryDotColor: .orange,
                                    progress: 0.50,
                                    completed: false        )
    }
}

//
//  TaskInfoScreen.swift
//  Todo-App-Task
//
//  Created by Kasivishwanathan M on 03/12/25.
//

import SwiftUI
struct TaskInfoScreen: View {
    
    
    let task : Task
    
    @Binding var goToInfo : Bool
    
    @State private var deleteTask = false
    @State private var deleteTaskId = UUID()
    
    @State private var snackBar = false
    @State private var snackBarMessage = ""
    @State private var snackBarState = SnackBarType.info
    @StateObject private var taskViewModel = TaskViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView (.vertical,showsIndicators : false){
            
            ZStack {
                VStack(alignment: .leading) {
                    
                    Text(task.title ?? "")
                        .font(.custom(Fonts.PUVI_EXTRABOLD, size: 40))
                        .padding(.vertical)
                    
                    VStack(spacing: 22) {
                        TaskInfoRow(icon: "calendar", iconColor: .blue, title: "Due Date", value: Utils.dateToString(task.dueDate ?? Date(),format: "dd MMM YYY"))
                        TaskInfoRow(icon: "exclamationmark.circle", iconColor: .red, title: "Priority", value: task.priority ?? "", valueColor: .red)
                        TaskInfoRow(icon: "folder", iconColor: .orange, title: "Category", value: task.category ?? " ")
                    }
                    .padding(.vertical,30)
                    .background(Color.cardColor)
                    .cornerRadius(20)
                    .shadow(color: .gray.opacity(0.2), radius: 10)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Description")
                            .font(.custom(Fonts.PUVI_MEDIUM, size: 21))
                        
                        Text("""
\(task.description)
""")
                            .lineSpacing(7)
                            .font(.custom(Fonts.PUVI_MEDIUM, size: 17))
                            .foregroundColor(.gray)

                    }
                    .padding(.vertical)
                    
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "checkmark.circle")
                            Text("Mark as Completed")
                                .fontWeight(.semibold)
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(15)
                    }
                    
                    HStack {
                        Button(action: {
                            deleteTask = true
                            deleteTaskId = task.id ?? UUID()
                        }) {
                            HStack {
                                Image(systemName: "trash")
                                Text("Delete Task")
                            }
                            .foregroundColor(.red)
                            .padding()
                        }
                        .padding(.horizontal)
                        .padding(.top, 5)
                        
                    }
                    .frame(maxWidth : .infinity)
                    
                    Spacer(minLength: 40)
                    
                    
              
                }
                if deleteTask {
                    AlertDialog(
                        isActive: $deleteTask,
                        title: "Delete This Task",
                        message: "Are you sure want to delete this task? Even if completed it will delete.",
                        buttonTitle: "Delete",
                        action: {
                            taskViewModel.deleteTask(
                                taskId: deleteTaskId,
                                onSuccess: {
                                    snackBar = true
                                    snackBarMessage = "Task Deleted Successfully !!!"
                                    snackBarState = .success
                                    goToInfo = false
                                },
                                onFailed: {
                                    snackBar = true
                                    snackBarMessage = "Task Delete Failed !!!"
                                    snackBarState = .error
                                }
                            )
                        }
                    )
                }
                
            }
            }
            .padding(.horizontal)
            .navigationBarTitle("Task Details", displayMode: .inline)
    }
}
struct TaskInfoRow: View {
    var icon: String
    var iconColor: Color
    var title: String
    var value: String
    var valueColor: Color = .black
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(iconColor.opacity(0.12))
                    .frame(width: 45, height: 45)
                
                Image(systemName: icon)
                    .foregroundColor(iconColor)
                    .font(.system(size: 20))
            }
            
            Text(title)
                .font(.custom(Fonts.PUVI_MEDIUM, size: 18))
            
            Spacer()
            
            Text(value)
                .font(.custom(Fonts.PUVI_REGULAR, size: 16))
                .foregroundColor(valueColor)
                .opacity(0.8)
        }
        .padding(.horizontal)
    }
}
/*
struct TaskInfoScreen_Previews: PreviewProvider {
    static var previews: some View {
        TaskInfoScreen()
    }
}
*/

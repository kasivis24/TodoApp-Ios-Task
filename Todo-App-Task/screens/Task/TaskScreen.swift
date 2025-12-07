//
//  TaskScreen.swift
//  Todo-App-Task
//
//  Created by Kasivishwanathan M on 03/12/25.
//


import SwiftUI
struct TaskScreen: View {
    @State private var selectedTask: Task? = nil
    @StateObject var taskViewModel = TaskViewModel()
    @State private var bottomSheet = false
    @State private var goToEdit = false
    @State private var goToTaskInfo = false
    @State private var deleteTask = false
    @State private var deleteTaskId = UUID()
    @State private var snackBar = false
    @State private var snackBarMessage = ""
    @State private var snackBarState = SnackBarType.info
    
    @State private var isLoaded = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .leading) {
                if let selectedTask = selectedTask  {
                    NavigationLink(
                        destination: EditTaskScreen(task: selectedTask, goToEdit: $goToEdit),
                        isActive: $goToEdit
                    ) {
                        EmptyView()
                    }
                    .hidden()
                }
                
                if let selectedTask = selectedTask  {
                    NavigationLink(
                        destination: TaskInfoScreen(task: selectedTask, goToInfo: $goToTaskInfo),
                        isActive: $goToTaskInfo
                    ) {
                        EmptyView()
                    }
                    .hidden()
                }
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 18) {
                        ForEach(taskViewModel.tasks, id: \.id) { task in
                            TaskItem(
                                title: task.title ?? "",
                                due: Utils.dateToString(task.dueDate ?? Date(), format: "dd MMM yyyy"),
                                category: task.category ?? "",
                                categoryColor: Color.categoryBackground( task.category ?? ""),
                                categoryDotColor: Color.categoryDot(task.category ?? ""),
                                progress: 0.25,
                                completed: task.isCompleted,
                                thumnail: task.thumnail,
                                flagColor: Color.priorityFlag(task.priority ?? ""),
                                isOverDue: task.isOverDue,
                                onTapEdit: {
                                    selectedTask = task
                                    goToEdit = true
                                },
                                onTapDelete: {
                  
                                    deleteTaskId = task.id ?? UUID()
                                    print("in ontapdelte closue -> taskId \(deleteTaskId)");                                deleteTask = true
                                    
                                },
                                onInfo: {
                                    selectedTask = task
                                    goToTaskInfo = true
                                }
                            )
                        }
                    }
                    .padding(.bottom, 70)
                }
                Spacer()
                if bottomSheet {
                    /*BottomSheet(showSheet: $bottomSheet) {
                        VStack {
                            Text("Bdisidhshdi")
                            Text("sd sbdisbijdbi")
                        }
                    }*/
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
            .navigationBarItems(
                leading: Text("MyTasks")
                    .font(.custom(Fonts.PUVI_BOLD, size: 32)),
                trailing: HStack {
                    Image(systemName: "arrow.up")
                        .font(.system(size: 18))
                        .foregroundColor(.blue)
                    Image(systemName: "")
                        .font(.system(size: 18))
                        .foregroundColor(.blue)
                }
            )
            .onAppear {
            
                if !isLoaded {
                        isLoaded = true
                        taskViewModel.fetchAllTasks(
                            onSuccess: {},
                            onFailure: {}
                        )
                    }
                
            }
        }
    }
}
struct TaskScreen_Previews: PreviewProvider {
    static var previews: some View {
        TaskScreen()
    }
}

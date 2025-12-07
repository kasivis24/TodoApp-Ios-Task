//
//  EditTaskScreen.swift
//  Todo-App-Task
//
//  Created by Kasivishwanathan M on 04/12/25.
//

import SwiftUI

struct EditTaskScreen : View {
    
    let task : Task
    @Binding var goToEdit : Bool
    
    @State private var taskId = UUID()
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var dueDate: Date? = nil
    @State private var reminder = false
    @State private var priority = "Medium"
    @State private var category = "Work"
    @State private var isCompleted = false
    @State private var datePicker = false

    @State private var showDatePicker = false
    
    @State private var snackBar = false
    @State private var snackBarMessgae = ""
    @State private var snackBarState = SnackBarType.info
    
    @StateObject private var taskViewModel = TaskViewModel()
    
    @State private var showImagePicker = false
     @State private var selectedImage: UIImage? = nil
    
    var body: some View {

            ScrollView {
                
                ZStack {
                    
                    
                VStack(alignment: .leading, spacing: 20) {

    
                    HStack (spacing : 10){
                        if let image = selectedImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 120, height: 120)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color.blue, lineWidth: 2)
                                    )
                                    .onTapGesture {
                                        showImagePicker = true
                                    }
                            } else {
                                Button(action: { showImagePicker = true }) {
                                    VStack(spacing: 10) {
                                        Image(systemName: "photo")
                                            .font(.system(size: 36))
                                            .foregroundColor(.blue)
                                        Text("Add Thumbnail")
                                            .foregroundColor(.blue)
                                            .font(.headline)
                                    }
                                    .frame(width: 140, height: 120)
                                    .background(Color(.systemGray6))
                                    .cornerRadius(16)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color.blue, style: StrokeStyle(lineWidth: 2, dash: [6]))
                                    )
                                }
                            }
                        
                    
                        VStack (alignment : .leading){
                            
                            SectionHeader(title: "Task Title")
                            
                        TextField("e.g., Buy groceries", text: $title)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(12)
                            
                        }
                        .frame(maxWidth : .infinity,alignment : .leading)
                    }
                    .frame(maxWidth : .infinity)
                    
                 
                    
                    SectionHeader(title: "Description")
                    TextField("Milk, bread, eggs...", text: $description)
                        .lineLimit(3)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                    
                    SectionTitle(title: "Scheduling")
                    VStack(spacing: 0) {
                        RowButton(icon: "calendar", title: "Due Date") {
                            showDatePicker.toggle()
                        } trailing: {
                            
                            
                            
                            Button (action : {
                                
                                showDatePicker = !showDatePicker
                                
                            }){
                                
                                
                                Text(dueDate == nil ? "SelectDate" :
                                        Utils.dateToString(dueDate!,format: "dd MMM YYYY"))
                                    .foregroundColor(.blue)
                            }
                        
                               
                        }
                        Divider()
                        RowButton(icon: "bell", title: "Set Reminder") {
                        } trailing: {
                            Toggle("", isOn: $reminder)
                        }
                    }
                    .background(Color.cardColor)
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
                    
                    SectionTitle(title: "Organization")
                    VStack(spacing: 0) {
                        HStack {
                            IconBackgroundView(icon: "flag.fill")
                            Text("Priority")
                                .font(.headline)
                            Spacer()
                            Picker("", selection: $priority) {
                                Text("Low").tag("Low")
                                Text("Medium").tag("Medium")
                                Text("High").tag("High")
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .frame(width: 180)
                        }
                        .padding()
                        Divider()
                        HStack {
                            IconBackgroundView(icon: "tag.fill")
                            Text("Category")
                                .font(.headline)
                            Spacer()
                            Picker("", selection: $category) {
                                Text("Work").tag("Work")
                                Text("Personal").tag("Personal")
                                Text("Others").tag("Others")
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .frame(width: 180)
                        }
                        .padding()
                    }
                    .background(Color.cardColor)
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
                    
                    SectionTitle(title: "Status")
                    VStack(spacing: 0) {
                        RowButton(icon: "checkmark.circle", title: "Mark as Completed") {} trailing: {
                            Toggle("", isOn: $isCompleted)
                        }
                    }
                    .background(Color.cardColor)
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
                }
                
                .sheet(isPresented : $showDatePicker){
                    
                    VStack {
                        
                        HStack {
                            Button (action : {
                                showDatePicker = !showDatePicker
                            }){

                                Text("Done")
                                    .font(.custom(Fonts.PUVI_MEDIUM, size: 18))
                                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/
                                )
                                
                            }
    
                        }
                        .frame(maxWidth : .infinity,alignment: .trailing)
                        .padding()
                        
                        DatePicker("Due Date",
                                             selection: Binding(
                                                 get: { dueDate ?? Date() },
                                                 set: { dueDate = $0 }
                                             ),                                                    displayedComponents: [.date]
                                         )
                        .datePickerStyle(GraphicalDatePickerStyle())
                        
          
                        
                    }
                    .frame(maxHeight : UIScreen.main.bounds.height * 0.40)
                    .padding()
                }
                .padding()
                    
                    
                    ZStack {
                        if snackBar {
                    SnackBar(message: snackBarMessgae,type : snackBarState)
                        }
                        
                    }
                    .frame(maxWidth : .infinity,maxHeight : .infinity, alignment : .top)
                    
                    
                }
                
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(image: $selectedImage)
            }
            .onAppear {
                print("Edit screene appaer id \(String(describing: task.id))")
                setTaskData()
            }
            .navigationTitle("Edit Task")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                trailing: Button("Update") {
                    
                    if validateFields() {
                        
                        taskViewModel.updateTask(taskModel: TaskModel(id :taskId,title: title,desc: description,dueDate: dueDate!,priority: priority,category: category,isCompleted: isCompleted,reminder: reminder,thumnail : selectedImage?.jpegData(compressionQuality: 0.5)), onSuccess: {
                            
                            snackBar = true
                            snackBarMessgae = "Task Update Successfully";
                            snackBarState = SnackBarType.success
                            
                            DispatchQueue.main.asyncAfter(deadline : .now()+2) {
                                
                                snackBar = false
                            }
                            
                        }, onFailed: {
                            
                            
                            snackBar = true
                            snackBarMessgae = "Task Update Failed !!!";
                            snackBarState = SnackBarType.error
                            
                            DispatchQueue.main.asyncAfter(deadline : .now()+2) {
                                
                                snackBar = false
                            }
                        })

                    }else {
                        
                        snackBar = true
                        snackBarMessgae = "All fields are must required !!!"
                        snackBarState = SnackBarType.warning
                        
                        DispatchQueue.main.asyncAfter(deadline : .now()+2) {
                            
                            snackBar = false
                        }
                        
                    }
                    
                }
            )
            
        
            
    
    }
    
    func setTaskData(){
        taskId = task.id ?? UUID()
        title = task.title ?? ""
        description = task.desc ?? ""
        dueDate = task.dueDate ?? Date()
        reminder = task.remainder
        priority = task.priority ?? ""
        category = task.category ?? ""
        isCompleted = task.isCompleted
        if let image = task.thumnail {
            selectedImage = UIImage(data : image)
            } else {
                selectedImage = nil
            }
    }
    
    func validateFields() -> Bool {
        if selectedImage == nil {
            return false
        }
        if title.isEmpty {
            return false
        }
        if description.isEmpty {
            return false
        }
        if dueDate == nil {
            return false
        }
        return true
    }
    
}


/*struct EditTaskScreen_Previews: PreviewProvider {
    static var previews: some View {
        EditTaskScreen()
    }
}*/

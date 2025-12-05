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
    
    let onTapEdit : ()-> Void
    let onTapDelete : ()-> Void
    let onInfo : () -> Void
    
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack (spacing : 15){
            
                
                VStack (alignment : .leading){
                    
                    Image(systemName: completed ? "checkmark.circle.fill" : "clock")
                        .foregroundColor(completed ? .green : .blue)
                
                    
                }
                
                
                VStack (alignment : .leading,spacing : 18){
                    HStack {
                        
                        Text(title)
                            .font(.custom(Fonts.PUVI_MEDIUM, size : 18))
                            .foregroundColor(completed ? .gray : .black)
                            .strikethrough(completed)
                        
                        Spacer()
                        
                        Menu {
                                Button( action: { print("Edit tapped")
                                    onTapEdit()
                                }){
                                    HStack {
                                        Text("Edit")
                                        
                                        Image("pencil")
                                    }
                                }
                                Button(action: { print("Delete tapped")
                                    onTapDelete()
                                }){
                                    HStack {
                                        Text("Delete")
                                        
                                        Image("trash.fill")
                                    }
                                }
                                Button(action: { print("Info tapped")
                                    onInfo()
                                }){
                                    HStack {
                                        Text("Info")
                                        
                                        Image("info")
                                    }
                                }
                        }
                        label: {
                        Image(systemName: "ellipsis")
                            .font(.headline)
                        }
                        
                    }
                    

                    HStack (){
                        Text("Due: \(due)")
                            .font(.custom(Fonts.PUVI_REGULAR, size: 18))
                            .foregroundColor(.gray)
                        
                        Image(systemName : "flag.fill")
                            .foregroundColor(.gray.opacity(0.8))
                            .padding(.horizontal)
                    }
                    
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
                
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(18)
        .shadow(color: .gray.opacity(0.15), radius: 5, x: 7, y: 10)
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
                                    completed: false,
            onTapEdit: {
                
            },
            onTapDelete: {
                
            },
            onInfo : {
                
            }
        )
    }
}

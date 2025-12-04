//
//  TaskInfoScreen.swift
//  Todo-App-Task
//
//  Created by Kasivishwanathan M on 03/12/25.
//

import SwiftUI
struct TaskInfoScreen: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    Text("Finalize Project\nProposal")
                        .font(.custom(Fonts.PUVI_EXTRABOLD, size: 40))
                        .padding(.vertical)
                    
                    VStack(spacing: 22) {
                        TaskInfoRow(icon: "calendar", iconColor: .blue, title: "Due Date", value: "Tomorrow, 10:00 AM")
                        TaskInfoRow(icon: "exclamationmark.circle", iconColor: .red, title: "Priority", value: "High", valueColor: .red)
                        TaskInfoRow(icon: "folder", iconColor: .orange, title: "Category", value: "Work Projects")
                    }
                    .padding(.vertical,30)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color: .gray.opacity(0.2), radius: 10)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Description")
                            .font(.custom(Fonts.PUVI_MEDIUM, size: 21))
                        
                        Text("""
Review the final draft of the project proposal, incorporate feedback from the team meeting, and send it to the client for final approval. Ensure all sections are complete and free of errors.
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
                        Button(action: {}) {
                            HStack {
                                Image(systemName: "trash")
                                Text("Delete Task")
                            }
                            .foregroundColor(.red)
                            .padding()
                        }
                        .padding(.horizontal)
                        .padding(.top, 5)                    }
                    .frame(maxWidth : .infinity)
                    
                    Spacer(minLength: 40)
                }
            }
            .padding(.horizontal)
            .navigationBarTitle("Task Details", displayMode: .inline)
            .navigationBarItems(
                leading: Button(action: { presentationMode.wrappedValue.dismiss() }) {
                    Image(systemName: "chevron.left")
                },
                trailing: Button("Edit") {}
            )
        }
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

struct TaskInfoScreen_Previews: PreviewProvider {
    static var previews: some View {
        TaskInfoScreen()
    }
}

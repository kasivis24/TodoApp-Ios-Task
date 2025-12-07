//
//  HomeScreen.swift
//  Todo-App-Task
//
//  Created by Kasivishwanathan M on 04/12/25.
import SwiftUI
struct HomeScreen: View {
    
    @State private var percent = 50
    
    var body: some View {
        
        ZStack {
            
            
            ScrollView {
                
                VStack (spacing : 15){
                    
                    
                    
                    Text("Good Morning Bro !")
                        .font(.custom(Fonts.PUVI_BOLD, size: 30)
                        )
                        .frame(maxWidth : .infinity,
                               alignment: .leading
                               )
                    
                    
                    HStack {
                        
                        DashboardCard(
                            title: "DueDate", value: "10", icon: "calendar",  gradient: Gradient(colors: [.blue.opacity(0.5), .blue])    )
                        
                        DashboardCard(
                            title: "Completed", value: "5", icon: "checkmark.circle.fill",  gradient: Gradient(colors: [.green.opacity(0.5), .green])    )
                        
                
                        
                    }
                    .frame(maxWidth : .infinity)
                    
                    
                    HStack {
                        
                        DashboardCard(
                            title: "Over Due", value: "10", icon: "exclamationmark.circle",  gradient: Gradient(colors: [.red.opacity(0.5), .red])    )
                        
                        DashboardCard(
                            title: "All Task", value: "5", icon: "tray.full",  gradient: Gradient(colors: [.gray.opacity(0.5), .gray])    )
                        
                
                        
                    }
                    .frame(maxWidth : .infinity)
                    
                    
                    VStack (alignment : .leading){
                        
                        VStack (alignment : .leading){
                        
                        Text("Taks by Priority")
                            .font(.custom(Fonts.PUVI_MEDIUM, size: 22))
                           
                            
                       
                      
                        PriorityRow(title : "High",color : Color.red,
                                    percent: 0.25
                                    )
                            
                            PriorityRow(title : "Medium",color : Color.orange,
                                        percent: 0.55
                                        )
                            
                            PriorityRow(title : "Low",color : Color.blue,
                                        percent: 0.85
                                        )
                            
                        }
                        .frame(maxWidth : .infinity,alignment: .leading)
                        .padding()
                        
                        
                        
                    }
                    .padding(.vertical)
                    .frame(maxWidth : .infinity, alignment: .leading)
                    .background(Color.cardColor)
                    .cornerRadius(12)
                    .shadow(color: .gray.opacity(0.15), radius: 5, x: 7, y: 10)
                    
                    
                    VStack {
                        
                        VStack (alignment : .leading){
                            
                            
                            Text("Upcoming Task")
                                .font(.custom(Fonts.PUVI_MEDIUM, size: 22))
                            
                            
                            UpcoimgTaskItem(icon : "calendar",title: "Finalize quarterly report",
                              dueDateContent: "Due date : 2 days",
                              priority: "high"
                              )
                            
                            Divider()
                            
                            UpcoimgTaskItem(icon : "calendar",title: "Finalize quarterly report",
                              dueDateContent: "Due date : 2 days",
                              priority: "high"
                              )
                        }
                        .padding()
                    }
                    .padding(.vertical)
                    .frame(maxWidth : .infinity, alignment: .leading)
                    .background(Color.cardColor)
                    .cornerRadius(12)
                    .shadow(color: .gray.opacity(0.15), radius: 5, x: 7, y: 10)
                   
                }
                .padding()
                
            }
            
        }
    }
}

struct UpcoimgTaskItem : View {
    var icon : String
    var title : String
    var dueDateContent : String
    var priority : String
    
    var body : some View {
        HStack {
            
            Image(systemName: icon)
                                .font(.title2)
                                .padding(10)
                                .background(Color.gray.opacity(0.2))
                                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            Spacer()
            
            VStack (alignment : .leading,spacing : 7){
                Text(title)
                    .font(.custom(Fonts.PUVI_MEDIUM, size: 18))
            
                
                Text(dueDateContent)
                    .font(.custom(Fonts.PUVI_REGULAR, size: 16))
            }
            
            Spacer()
            
            Circle()
                .fill(Color.priorityFlag(priority))
                .frame(width: 13, height: 13)
            
        }
        .frame(maxWidth : .infinity)
        .padding(.vertical)
    }
    
}

struct PriorityRow: View {
    var title: String
    var color: Color
    var percent: CGFloat
    var body: some View {
        HStack {
            Text(title)
                .font(.custom(Fonts.PUVI_MEDIUM, size: 17))
                .frame(maxWidth : 100,alignment: .leading)
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Capsule().fill(Color.gray.opacity(0.2))
                    Capsule().fill(color).frame(width: geo.size.width * percent)
                }
            }
            .frame(height: 6)
        }
    }
}

struct DashboardCard: View {
    var title: String
    var value: String
    var icon: String
    var gradient: Gradient
    var body: some View {
        ZStack {
            LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing)
            ZStack {
                Circle()
                    .fill(Color.white.opacity(0.25))
                    .frame(width: 180, height: 180)
                    .offset(x: 50, y: -60)
                Circle()
                    .fill(Color.white.opacity(0.15))
                    .frame(width: 120, height: 120)
                    .offset(x: -40, y: 30)
            }
            VStack(alignment: .leading, spacing: 16) {
                
                HStack {
                    Image(systemName: icon)
                                        .font(.title2)
                                        .padding(10)
                                        .background(Color.white.opacity(0.2))
                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    Spacer()
                    
                    Text(title)
                        .font(.custom(Fonts.PUVI_MEDIUM, size: 18))
                    
                }
                
                Text(value)
                    .font(.custom(Fonts.PUVI_BOLD, size: 35)
                )
                
            }
            .frame(alignment : .leading)
            .foregroundColor(.white)
            .padding()
        }
        .frame(height: 140)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.15), radius: 10)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

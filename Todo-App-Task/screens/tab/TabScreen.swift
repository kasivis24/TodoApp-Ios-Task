//
//  TabView.swift
//  Todo-App-Task
//
//  Created by Kasivishwanathan M on 04/12/25.
//

import SwiftUI

struct TabScreen: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        

            TabView (selection : $selectedTab){
                
                HomeScreen()
                    .tabItem {
                        Image(Icons.HOME_IC)
                            .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                        Text("Home")
                    }
                    .tag(0)
                
                TaskScreen()
                    .tabItem {
                        Image(Icons.TASK_IC)
                            .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                        Text("Task")
                    }
                    .tag(1)
                
                
                CreateTaskScreen()
                    .tabItem {
                        
                        Image(Icons.ADDTASK_IC)
                            .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                        Text("Add Task")
                        
                    }
                    .tag(2)
                
                SearchScreen()
                    .tabItem {
                        
                        Image(Icons.SEARCH_IC)
                            .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                        Text("Search")
                        
                    }
                    .tag(3)
                
                SettingsScreen()
                    .tabItem {
                        
                        Image(Icons.SETTING_IC)
                            .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                        Text("Settings")
                        
                    }
                    .tag(4)
                
            
                
            }
            .accentColor(.blue)
                        
        }

}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabScreen()
    }
}

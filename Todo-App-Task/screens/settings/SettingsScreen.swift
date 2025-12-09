//
//  SettingsScreen.swift
//  Todo-App-Task
//
//  Created by Kasivishwanathan M on 04/12/25.
//


import SwiftUI
struct SettingsScreen: View {
    
    @State private var isDarkMode = false
    @State private var notificationsEnabled = true
    
    @EnvironmentObject var themeManager : ThemeManager
    
    var body: some View {
        NavigationView {
        
            Form {
               
                Section(header: Text("APPEARANCE")
                            .font(
                                .custom(Fonts.PUVI_MEDIUM, size: 18)
                            )
                            .padding(.vertical)
                            
                ) {
                    Toggle(isOn: $themeManager.isDarkMode) {
                        Label("Dark Mode", systemImage: "moon.fill")
                        
                    }
                    
                    NavigationLink(destination: AppIconScreen()) {
                        HStack {
                            Label("App Icon", systemImage: "app.fill")
                            Spacer()
                            Text("Default")
                                .foregroundColor(.gray)
                        }
                    }
                }
                
                
                Section(header: Text("NOTIFICATIONS").font(
                    .custom(Fonts.PUVI_MEDIUM, size: 18)
                )
                .padding(.vertical)                ) {
                    Toggle(isOn: $notificationsEnabled) {
                        Label("Enable Notifications", systemImage: "bell.fill")
                    }
                    
                    NavigationLink(destination: ReminderAlertScreen()) {
                        Label("Reminder Alerts", systemImage: "alarm.fill")
                    }
                }
                
             
                Section(header: Text("DATA MANAGEMENT").font(
                    .custom(Fonts.PUVI_MEDIUM, size: 18)
                )
                .padding(.vertical)                ) {
                    Button(action: exportData) {
                        Label("Export Data", systemImage: "square.and.arrow.up.fill")
                            .foregroundColor(.orange)
                    }
                    
                    Button(action: resetAllData) {
                        Label("Reset All Data", systemImage: "trash.fill")
                            .foregroundColor(.red)
                    }
                }
                
               
                Section(header: Text("SUPPORT").font(
                    .custom(Fonts.PUVI_MEDIUM, size: 18)
                )
                .padding(.vertical)                ) {
                    NavigationLink(destination: HelpScreen()) {
                        Label("Help & Feedback", systemImage: "questionmark.circle.fill")
                    }
                    NavigationLink(destination: RateAppScreen()) {
                        Label("Rate App", systemImage: "star.fill")
                    }
                }
                
                
                VStack {
                    Text("Version 1.0.0 (123)")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .padding(.vertical, 10)
            }
            .navigationTitle("Settings")
        }
    }
    
  
    func exportData() {
        print("Export tapped")
    }
    
    func resetAllData() {
        print("Reset tapped")
    }
}
struct AppIconScreen: View {
    var body: some View {
        Text("App Icon Options")
    }
}
struct ReminderAlertScreen: View {
    var body: some View {
        Text("Reminder Alert Settings")
    }
}
struct HelpScreen: View {
    var body: some View {
        Text("Help & Feedback screen")
    }
}
struct RateAppScreen: View {
    var body: some View {
        Text("Rate the app")
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}

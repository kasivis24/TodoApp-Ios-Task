//
//  Utils.swift
//  Todo-App-Task
//
//  Created by Kasivishwanathan M on 03/12/25.
//

import Foundation

struct Utils {
    
    
    static func getTimePeriod() -> String {
            let hour = Calendar.current.component(.hour, from: Date())
            switch hour {
            case 5...11:
                return "Morning"
            case 12...16:
                return "Afternoon"
            case 17...20:
                return "Evening"
            default:
                return "Night"
            }
        }
    
    
    static func dateToString(_ date: Date, format: String = "dd-MM-yyyy") ->String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.string(from: date)
        
    }
    
    static func relativeDayString(from date: Date) -> String {
            let calendar = Calendar.current
            let today = calendar.startOfDay(for: Date())
            let target = calendar.startOfDay(for: date)
            
            guard let diff = calendar.dateComponents([.day], from: today, to: target).day else {
                return ""
            }
            
            switch diff {
            case 0:
                return "Today"
            case 1:
                return "Tomorrow"
            case 2...6:
                return "In \(diff) days"
            default:
                let formatter = DateFormatter()
                formatter.dateStyle = .medium
                return formatter.string(from: date)
            }
        }
}

//
//  Utils.swift
//  Todo-App-Task
//
//  Created by Kasivishwanathan M on 03/12/25.
//

import Foundation

struct Utils {
    static func dateToString(_ date: Date, format: String = "dd-MM-yyyy") ->String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.string(from: date)
        
    }
    
}

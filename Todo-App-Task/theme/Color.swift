//
//  Color.swift
//  Todo-App-Task
//
//  Created by Kasivishwanathan M on 06/12/25.
//

import Foundation
import SwiftUI

extension Color {
    static let cardColor = Color("CardGray")
    static let primaryColor = Color("PrimaryColor")
    
    
    
    static func categoryBackground(_ category: String) -> Color {
            switch category.lowercased() {
            case "personal":
                return Color.green.opacity(0.2)
            case "work":
                return Color.purple.opacity(0.2)
            default:
                return Color.orange.opacity(0.2)
            }
        }
        
        static func categoryDot(_ category: String) -> Color {
            switch category.lowercased() {
            case "personal":
                return Color.green
            case "work":
                return Color.purple
            default:
                return Color.orange
            }
        }
    
    
    static func priorityFlag(_ priority: String) -> Color {
        switch priority.lowercased() {
        case "high":
            return Color.red
        case "medium":
            return Color.orange
        default:
            return Color.blue
        }
    }
}

//
//  SnackBarType.swift
//  Todo-App-Task
//
//  Created by Kasivishwanathan M on 04/12/25.
//

import Foundation
import SwiftUI

enum SnackBarType {
    case success
    case error
    case warning
    case info
    
    var iconName: String {
        switch self {
        case .success: return "checkmark.circle.fill"
        case .error: return "xmark.octagon.fill"
        case .warning: return "exclamationmark.triangle.fill"
        case .info: return "info.circle.fill"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .success: return .green
        case .error: return .red
        case .warning: return .orange
        case .info: return .blue
        }
    }
}

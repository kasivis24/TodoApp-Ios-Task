//
//  BottomSheetSize.swift
//  Todo-App-Task
//
//  Created by Kasivishwanathan M on 05/12/25.
//

import Foundation
import SwiftUI
enum BottomSheetSize {
    case small
    case medium
    case large
    var height: CGFloat {
        switch self {
        case .small:
            return 200
        case .medium:
            return 400   
        case .large:
            return UIScreen.main.bounds.height * 0.8
        }
    }
}

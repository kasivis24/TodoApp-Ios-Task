//
//  ThemeManager.swift
//  Todo-App-Task
//
//  Created by Kasivishwanathan M on 06/12/25.
//

import Foundation
import SwiftUI
class ThemeManager : ObservableObject{
    @AppStorage("isDarkMode") var isDarkMode: Bool = false {
            didSet {
                applyTheme()
            }
        }
        init() {
            applyTheme()
        }
        func applyTheme() {
            UIApplication.shared.windows.first?.overrideUserInterfaceStyle =
                isDarkMode ? .dark : .light
        }
}

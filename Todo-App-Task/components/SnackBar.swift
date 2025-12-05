//
//  SnackBar.swift
//  Todo-App-Task
//
//  Created by Kasivishwanathan M on 04/12/25.
//

import Foundation
import SwiftUI

struct SnackBar: View {
    var message: String
    var type: SnackBarType
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: type.iconName)
                .font(.system(size: 18))
                .foregroundColor(.white)
            
            Text(message)
                .foregroundColor(.white)
                .font(.body)
            
            Spacer()
        }
        .padding()
        .background(type.backgroundColor.opacity(0.9))
        .cornerRadius(12)
        .padding(.horizontal)
        .transition(.move(edge: .bottom).combined(with: .opacity))
        .animation(.easeInOut, value: message)
    }
}

struct SnackBar_Previews: PreviewProvider {
    static var previews: some View {
        SnackBar(message : "Helloe Kasi",type : SnackBarType.success)
    }
}

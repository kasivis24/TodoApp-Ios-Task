//
//  TaskProgressBar.swift
//  Todo-App-Task
//
//  Created by Kasivishwanathan M on 03/12/25.
//

import SwiftUI

struct TaskProgressBar: View {
    var progress: CGFloat
    
    var body: some View {
        HStack {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 100, height: 8)
                
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.blue)
                    .frame(width: 100 * progress, height: 8)
            }
            
            Text("\(Int(progress * 100))%")
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}

struct TaskProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        TaskProgressBar(progress : 10.0)
    }
}

//
//  AlertDialog.swift
//  Todo-App-Task
//
//  Created by Kasivishwanathan M on 05/12/25.
//
import SwiftUI
struct AlertDialog: View {
    
    @Binding var isActive: Bool
    let title: String
    let message: String
    let buttonTitle: String
    let action: () -> ()
    
    @State private var offset: CGFloat = 1000
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .onTapGesture {
                    close()
                }
            
            VStack {
                Text(title)
                    .font(.title2)
                    .bold()
                    .padding()
                
                Text(message)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                HStack {
                    Button(action: {
                        close()
                    }) {
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.gray.opacity(0.2))
                            Text("Cancel")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.black.opacity(0.7))
                                .padding()
                        }
                        .padding()
                    }
                    Button(action: {
                        action()
                        close()
                    }) {
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.red)
                            Text(buttonTitle)
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.white)
                                .padding()
                        }
                        .padding()
                    }
                    
                    
                }
                
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(
                Button(action: {
                    close()
                }) {
                    Image(systemName: "xmark")
                        .font(.title2)
                        .foregroundColor(.black)
                        .padding()
                }
                .padding(),
                alignment: .topTrailing
            )
            .shadow(radius: 20)
            .padding(30)
            .offset(x: 0, y: offset)
            .onAppear {
                withAnimation(.spring()) {
                    offset = 0
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    func close() {
        withAnimation(.spring()) {
            offset = 1000
            isActive = false
        }
    }
}
struct AlertDialog_Previews: PreviewProvider {
    static var previews: some View {
        AlertDialog(isActive: .constant(true),
                     title: "Delete This Task",
                     message: "This lets you choose which photos you want to add to this project.",
                     buttonTitle: "Delete",
                     action: {})
    }
}

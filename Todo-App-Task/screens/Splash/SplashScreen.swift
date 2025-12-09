//
//  SplashScreen.swift
//  Todo-App-Task
//
//  Created by Kasivishwanathan M on 02/12/25.
//

import SwiftUI

struct SplashScreen: View {
    @State private var scale: CGFloat = 0.6
    @State private var opacity: Double = 0.3
    @State private var navigate = false

    var body: some View {
        ZStack {
            if navigate {
                TabScreen()
                    .transition(.opacity)   // smooth fade
                    .animation(.easeInOut(duration: 0.5), value: navigate)
            } else {
                splashContent
            }
        }
        .ignoresSafeArea()
    }

    private var splashContent: some View {
        ZStack {
            Image(Icons.APP_LOGO)
                .resizable()
                .scaledToFit()
                .frame(width: 160, height: 160)
                .scaleEffect(scale)
                .opacity(opacity)
                .onAppear {
                    animateLogo()
                }

            VStack {
                Spacer()
                Text("Zodo")
                    .font(.custom(Fonts.PUVI_BOLD, size: 32))
                    .foregroundColor(Color.gray.opacity(0.4))
                    .padding(.bottom, 32)
            }
        }
    }

    private func animateLogo() {
        withAnimation(.easeIn(duration: 1.5)) {
            scale = 1.0
            opacity = 1.0
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation {
                navigate = true
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}

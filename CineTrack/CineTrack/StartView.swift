//
//  ContentView.swift
//  CineTrack
//
//  Created by Gerson Vieira on 16/11/24.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("Choose an Option")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .padding(.top, 40)

                // Navegação para LoginView
                NavigationLink(destination: LoginView()) {
                    CustomButton(title: "Go to LoginView",
                                 width: 200,
                                 height: 50,
                                 gradientColors: [.blue, .green]) {}
                }

                // Navegação para LoginViewAnimation
                NavigationLink(destination: LoginAnimationView()) {
                    CustomButton(title: "Go to LoginViewAnimation",
                                 width: 200,
                                 height: 50,
                                 gradientColors: [.purple, .pink]) {}
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemGray6))
            .ignoresSafeArea()
        }
    }
}

#Preview {
    StartView()
}

//
//  LoginAnimationView.swift
//  CineTrack
//
//  Created by Gerson Vieira on 21/11/24.
//

import SwiftUI

struct LoginAnimationView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLoggedIn = ""
    
    // Estados para animações
    @State private var rectangleOffset: CGFloat = -1000 // Começa fora da tela no canto superior direito
    @State private var formOffset: CGFloat = -500 // Campos começam fora da tela, no topo
    
    var body: some View {
        ZStack {
            
            Color.black
            
            // RoundedRectangle com animação
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.pink, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 1000, height:  400)
                .rotationEffect(.degrees(135))
                .offset(y: rectangleOffset) // Controla o movimento
                .animation(.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.3), value: rectangleOffset)
            
            VStack(spacing: 20) {
                Text("CineTrack")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .offset(y: formOffset) // Animação no texto
                    .animation(.easeOut(duration: 0.8).delay(0.2), value: formOffset)
                
                // Campo de email com animação
                TextField("Email", text: $email)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty) {
                        Text("Email")
                            .foregroundColor(.white)
                            .padding(.horizontal, 4)
                    }
                
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundStyle(.white)
                
                // Campo de senha com animação
                SecureField("Password", text: $password)
                    .foregroundStyle(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: password.isEmpty) {
                        Text("Password")
                            .foregroundColor(.white)
                            .padding(.horizontal, 4)
                    }
                
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundStyle(.white)
                
                // Botão de Sign Up
                CustomButton(title: "Sign Up",
                             width: 200,
                             height: 40,
                             gradientColors: [.pink, .red]) {
                    //sign
                }
                .padding(.top)
                
                // Botão de Login
                CustomButton(title: "Already have an account? Login",
                             width: 300,
                             height: 40,
                             gradientColors: nil) {
                    //  Login
                }
                .padding(.top)
            }
            .offset(y: formOffset) // Animação em todos os campos
            .animation(.easeOut(duration: 1).delay(0.4), value: formOffset)
            .frame(width: 350)
        }
        .ignoresSafeArea()
        .onTapGesture {
            hideKeyboard()
        }
        .onAppear {
            // Iniciar animações
            rectangleOffset = -350 // Posição final do RoundedRectangle
            formOffset = 0         // Traz os campos e botões para a posição original
        }
    }
}

#Preview {
    LoginView()
}

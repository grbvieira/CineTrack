//
//  LoginView.swift
//  CineTrack
//
//  Created by Gerson Vieira on 20/11/24.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLoggedIn = ""
    
    var body: some View {
        VStack {
            ZStack {
                
                Color.black
                
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .foregroundStyle(.linearGradient(colors: [.pink, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 1000, height:  400)
                    .rotationEffect(.degrees(135))
                    .offset(y: -350)
                
                VStack(spacing: 20) {
                    /*Text("Welcome")
                     .foregroundColor(.white)
                     .font(.system(size: 40, weight: .bold, design: .rounded))
                     .offset(y: -350)*/
                    
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
                    
                    CustomButton(title: "Sign Up",
                                 width: 200,
                                 height: 40,
                                 gradientColors: [.pink, .red]) {
                        //sign
                    }
                                 .padding(.top)
                                 .offset(y: 100)
                    
                    CustomButton(title: "Already have an account? Login",
                                 width: 300,
                                 height: 40,
                                 gradientColors: nil) {
                        //  Login
                    }
                                 .padding(.top)
                                 .offset(y: 100)
                    
                }
                .frame(width: 350)
            }
            .ignoresSafeArea()
            .onTapGesture {
                hideKeyboard()
            }
        }
    }
}

struct LoginView_Preview: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

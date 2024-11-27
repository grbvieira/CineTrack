//
//  NewLoginView.swift
//  CineTrack
//
//  Created by Gerson Vieira on 23/11/24.
//

import SwiftUI

struct NewLoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLoggedIn = ""
    
    var body: some View {
        VStack {
            VStack {
                Image("appIcon")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .padding(.vertical, 32)
                
                VStack(spacing: 24) {
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "name@example.com")
                    .autocapitalization(.none)
                    
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter your password",
                              isSecureField: true)
                    
                    LoginButton(text: "Sign",
                                image: "arrow.right",
                                backgroundColor: Color(.systemBlue), textColor: .white) {
                        // Sign
                    }
                    
                }
                .padding(.horizontal, 12)
                
                Spacer()
                
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.bold)
                    }
                    .foregroundColor(Color(.systemBlue))
                }
            }
        }
        .onTapGesture {
            print("tocou na tela")
            hideKeyboard()
        }
    }
}

struct NewLoginView_Preview: PreviewProvider {
    static var previews: some View {
        NewLoginView()
    }
}

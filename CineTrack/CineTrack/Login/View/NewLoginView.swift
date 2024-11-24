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
                // Logo
                VStack(alignment: .center, spacing: 24) {
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "name@example.com")
                    .autocapitalization(.none)
                    
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter your password",
                              isSecureField: true)
                    
                    LoginButton(title: "Sign",
                                image: "arrow.right",
                                backgroundColor: Color(.systemBlue)) {
                        // Sign
                    }
                    
                }
                .padding(.horizontal, 12)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                
                NavigationLink {
                    // To Page of registration
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

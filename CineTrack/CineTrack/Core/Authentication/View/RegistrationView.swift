//
//  RegistrationView.swift
//  CineTrack
//
//  Created by Gerson Vieira on 23/11/24.
//

import SwiftUI
struct RegistrationView: View {
    @State private var email = ""
    @State private var fullName = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Image("appIcon")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .padding(.vertical, 32)
            
            VStack(alignment: .center, spacing: 24) {
                InputView(text: $email,
                          title: "Email Address",
                          placeholder: "name@example.com")
                .autocapitalization(.none)
                
                InputView(text: $fullName,
                          title: "Full name",
                          placeholder: "Enter your name",
                          isSecureField: true)
                
                InputView(text: $password,
                          title: "Password",
                          placeholder: "Enter your password",
                          isSecureField: true)
                
                InputView(text: $confirmPassword,
                          title: "Confirm password",
                          placeholder: "Confirm your password",
                          isSecureField: true)
                
                
                LoginButton(text: "Sign up",
                            image: "arrow.right",
                            backgroundColor: Color(.systemBlue),
                            textColor: .white) {
                    // Sign
                }
                
            }
            .padding(.horizontal, 12)
            
            Spacer()
            
            LoginButton(text: "Alredy have a account?",
                        secondText: "Sign",
                        image: nil,
                        textColor: Color(.systemBlue)) {
                dismiss()
            }
        }
    }
}

struct RegistrationView_Preview: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

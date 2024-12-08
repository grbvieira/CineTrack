//
//  RegistrationView.swift
//  CineTrack
//
//  Created by Gerson Vieira on 23/11/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = String()
    @State private var fullName = String()
    @State private var password = String()
    @State private var confirmPassword = String()
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            Image(LocalizedStringApp.images.appIcon.rawValue)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .padding(.vertical, 32)
            
            VStack(alignment: .center, spacing: 24) {
                InputView(text: $email,
                          title: LocalizedStringApp.textFielTitle.emailAddress.rawValue,
                          placeholder: LocalizedStringApp.placeholder.emailExample.rawValue)
                .autocapitalization(.none)
                
                InputView(text: $fullName,
                          title: LocalizedStringApp.textFielTitle.fullName.rawValue,
                          placeholder: LocalizedStringApp.placeholder.fullName.rawValue,
                          isSecureField: false)
                
                InputView(text: $password,
                          title: LocalizedStringApp.textFielTitle.password.rawValue,
                          placeholder: LocalizedStringApp.placeholder.enterPassword.rawValue,
                          isSecureField: true)
                
                ZStack {
                    InputView(text: $confirmPassword,
                              title: LocalizedStringApp.textFielTitle.confirmPassword.rawValue,
                              placeholder: LocalizedStringApp.placeholder.confirmPassword.rawValue,
                              isSecureField: true)
                }
                
                LoginButton(text: LocalizedStringApp.buttonTitle.signUp.rawValue,
                            image: LocalizedStringApp.images.arrowRight.rawValue,
                            backgroundColor: Color(.systemBlue),
                            textColor: .white) {
                    Task {
                        try await viewModel.createUser(withEmail: email,
                                                       password: password,
                                                       fullName: fullName)
                    }
                }.disabled(!formIsValid && !self.viewModel.isLoading)
                    .opacity(formIsValid ? 1.0 : 0.5)
                    .opacity(self.viewModel.isLoading ? 0.5 : 1.0)
                    .overlay {
                        ProgressView()
                            .scaleEffect(self.viewModel.isLoading ? 1 : 0)
                    }
                
            }
            .padding(.horizontal, 12)
            
            Spacer()
            
            SecondButton(firstLabel: LocalizedStringApp.buttonTitle.haveAnAccount.rawValue,
                         secondLabel: LocalizedStringApp.buttonTitle.haveAnAccount.rawValue,
                         secondLabelIsBold: true,
                         textColor: Color(.systemBlue)) {
                dismiss()
            }
        }
    }
}

extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 8
        && !fullName.isEmpty
    }
}
struct RegistrationView_Preview: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

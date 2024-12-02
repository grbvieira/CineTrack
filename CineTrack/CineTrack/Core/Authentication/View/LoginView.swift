//
//  NewLoginView.swift
//  CineTrack
//
//  Created by Gerson Vieira on 23/11/24.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = String()
    @State private var password =  String()
    @State private var userIsLoggedIn =  String()
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            Image(LocalizedStringApp.images.appIcon.rawValue)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .padding(.vertical, 32)
            
            VStack(spacing: 24) {
                InputView(text: $email,
                          title: LocalizedStringApp.textFielTitle.emailAddress.rawValue,
                          placeholder: LocalizedStringApp.placeholder.emailExample.rawValue)
                .autocapitalization(.none)
                
                InputView(text: $password,
                          title: LocalizedStringApp.textFielTitle.password.rawValue,
                          placeholder: LocalizedStringApp.placeholder.enterPassword.rawValue,
                          isSecureField: true)
                
                LoginButton(text: LocalizedStringApp.buttonTitle.signIn.rawValue,
                            image: LocalizedStringApp.images.arrowRight.rawValue,
                            backgroundColor: Color(.systemBlue),
                            textColor: .white) {
                    Task {
                        try await viewModel.signIn(withEmail: email, password: password)
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
            
            SecondButton(firstLabel: LocalizedStringApp.buttonTitle.loginFirstLabel.rawValue,
                         secondLabel: LocalizedStringApp.buttonTitle.signIn.rawValue,
                         secondLabelIsBold: true,
                         textColor: Color(.systemBlue)) {
                self.coordinator.push(page: .signUp)
            }
            
            
        }
        .alert(isPresented: $viewModel.isAlertPresent) {
            Alert(title: Text("Error"),
                  message: Text(viewModel.alertMessage),
                  dismissButton: .default(Text("Ok")))
        }
    }
}

// MARK: - AuthenticationFormProtocol
extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 8
    }
}

struct LoginView_Preview: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

//
//  AuthenticationViewModel.swift
//  CineTrack
//
//  Created by Gerson Vieira on 07/12/24.
//

import FirebaseAuth

@MainActor
final class AuthenticationViewModel: ObservableObject {
    
    func signUpEmail(withEmail email: String, password: String) async throws {
        let authResult = try await AuthenticationManager.shared.createUser(withEmail: email, password: password)
        let user = UserDB(auth: authResult)
        try await UserManager.shared.createNewUser(user: user)
    }
    
    func signInEmail(withEmail email: String, password: String) async throws {
        try await AuthenticationManager.shared.signIn(withEmail: email, password: password)
    }
    
    func signInGoogle() async throws {
        let helper = SignInGoogleHelper()
        let tokens = try await helper.singIn()
        let result = try await AuthenticationManager.shared.signInWhitGoogle(tokens: tokens)
        let user = UserDB(auth: result)
        try await UserManager.shared.createNewUser(user: user)
    }
}

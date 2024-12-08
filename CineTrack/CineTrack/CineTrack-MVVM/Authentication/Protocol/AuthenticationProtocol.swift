//
//  AuthenticationProtocol.swift
//  CineTrack
//
//  Created by Gerson Vieira on 06/12/24.
//

import FirebaseAuth


protocol AuthenticationManagerContract {
    func signOut() throws
    func delete() async throws
    func getProviders() throws -> [AuthProviders]
    func getAuthenticatedUser() throws -> AuthViewData
}

protocol SignInEmailContract {
    func createUser(withEmail email: String, password: String) async throws -> AuthViewData
    func signIn(withEmail email: String, password: String) async throws -> AuthViewData
    func resetPassword(email: String) async throws
    func updatePassword(password: String) async throws
    func updateEmail(email: String) async throws
}

protocol SignInSSOContract {
    func signInWhitGoogle(tokens: GoogleSignInResultModel) async throws -> AuthViewData
    func signInWhitFacebook() async throws -> AuthViewData
    func signIn(credential: AuthCredential) async throws -> AuthViewData
}

protocol AuthenticationEmailContract {
    func signInEmail(withEmail email: String, password: String) async throws
    func signUpEmail(withEmail email: String, password: String) async throws
}

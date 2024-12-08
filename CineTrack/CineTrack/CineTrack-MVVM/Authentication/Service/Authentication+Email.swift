//
//  Authentication+Email.swift
//  CineTrack
//
//  Created by Gerson Vieira on 06/12/24.
//

import FirebaseAuth

// MARK: - Sign in Email

extension AuthenticationManager: SignInEmailContract {
    
    @discardableResult
    func createUser(withEmail email: String, password: String) async throws -> AuthViewData {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthViewData(user: result.user)
    }
    
    @discardableResult
    func signIn(withEmail email: String, password: String) async throws -> AuthViewData {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        return AuthViewData(user: result.user)
    }
    
    func resetPassword(email: String) async throws {
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }
    
    func updatePassword(password: String) async throws {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        
        try await user.updatePassword(to: password)
    }
    
    func updateEmail(email: String) async throws {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        
        try await user.sendEmailVerification(beforeUpdatingEmail: email)//updateEmail(to: email)
    }
}

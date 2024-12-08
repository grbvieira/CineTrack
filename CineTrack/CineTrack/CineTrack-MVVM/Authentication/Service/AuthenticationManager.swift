//
//  AuthenticationManager.swift
//  CineTrack
//
//  Created by Gerson Vieira on 02/12/24.
//

import FirebaseAuth

final class AuthenticationManager: AuthenticationManagerContract {
    
    static let shared = AuthenticationManager()
    private init () { }
    
    func signOut() throws {
        do {
            try Auth.auth().signOut()
        } catch {
            print("DEBUG: Error SignOut \(error.localizedDescription)")
        }
    }
    
    func delete() async throws {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badURL)
        }
        try await user.delete()
    }
    
    func getProviders() throws -> [AuthProviders] {
        guard let providerData = Auth.auth().currentUser?.providerData else {
            throw URLError(.badServerResponse)
        }
        
        var providers: [AuthProviders] = []
        
        for provider in providerData {
            if let option = AuthProviders(rawValue: provider.providerID) {
                providers.append(option)
            } else {
                assertionFailure("Provider option not found: \(provider.providerID)")
            }
        }
        
        return providers
    }
    
    func getAuthenticatedUser() throws -> AuthViewData {
        guard let user = Auth.auth().currentUser else {
            print("DEBUG getAuthenticatedUser")
            throw URLError(.badServerResponse)
        }
        
        return AuthViewData(user: user)
    }
}


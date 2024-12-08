//
//  Authentication+SSO.swift
//  CineTrack
//
//  Created by Gerson Vieira on 06/12/24.
//

import FirebaseAuth

// MARK: - Sign In SSO

extension AuthenticationManager: SignInSSOContract {
    func signIn(credential: FirebaseAuth.AuthCredential) async throws -> AuthViewData {
        let result = try await Auth.auth().signIn(with: credential)
        return AuthViewData(user: result.user)
    }
    
    func signInWhitGoogle(tokens: GoogleSignInResultModel) async throws -> AuthViewData {
        let credential = GoogleAuthProvider.credential(withIDToken: tokens.idToken, accessToken: tokens.accessToken)
        return try await signIn(credential: credential)
    }
    
   /* func signInWhitFacebook() async throws -> AuthViewData {
        //Facebook Sign
        
    } */
    

}

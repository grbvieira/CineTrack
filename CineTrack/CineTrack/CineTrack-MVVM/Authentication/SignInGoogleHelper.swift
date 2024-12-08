//
//  SignInGoogleHelper.swift
//  CineTrack
//
//  Created by Gerson Vieira on 06/12/24.
//

import GoogleSignIn
import GoogleSignInSwift

final class SignInGoogleHelper {
    @MainActor
    func singIn() async throws -> GoogleSignInResultModel {
        guard let topController = Utilities.shared.topViewController() else {
            throw URLError(.cannotFindHost)
        }
        
        let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topController)
        
        guard let idToken = gidSignInResult.user.idToken?.tokenString else {
            throw URLError(.badServerResponse)
        }
        
        let accessToken = gidSignInResult.user.accessToken.tokenString
        let name = gidSignInResult.user.profile?.name
        let email = gidSignInResult.user.profile?.email

        let tokens = GoogleSignInResultModel(idToken: idToken, accessToken: accessToken, name: name, email: email)
        return tokens
    }
}

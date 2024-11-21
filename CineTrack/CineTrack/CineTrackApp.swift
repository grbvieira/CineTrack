//
//  CineTrackApp.swift
//  CineTrack
//
//  Created by Gerson Vieira on 16/11/24.
//

import SwiftUI

@main
struct CineTrackApp: App {
    var body: some Scene {
        WindowGroup {
            StartView()
        }
    }
    
   /* func signUp(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
            } else if let user = authResult?.user {
                completion(.success(user))
            }
        }
    }

    func signIn(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
            } else if let user = authResult?.user {
                completion(.success(user))
            }
        }
    }*/
}

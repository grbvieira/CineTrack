//
//  LoginViewModel.swift
//  CineTrack
//
//  Created by Gerson Vieira on 21/11/24.
//

import FirebaseAuth
import FirebaseFirestore

@MainActor
protocol AuthViewModelContract {
    func signIn(withEmail email: String, password: String) async throws
    func createUser(withEmail email: String, password: String, fullName: String) async throws
    func signOut()
    func deleAccount()
    func fetchUser() async
}

class AuthViewModel: ObservableObject, AuthViewModelContract{
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
     
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        
    }
    
    func createUser(withEmail email: String, password: String, fullName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession =  result.user
            let user = User(id: result.user.uid, fullName: fullName, email: email)
            let encoderUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encoderUser)
        } catch {
            print ("DEBUG: Failed to create user with error: \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        
    }
    
    func deleAccount() {
        
    }
    
    func fetchUser() async {
        
    }
    
    
}

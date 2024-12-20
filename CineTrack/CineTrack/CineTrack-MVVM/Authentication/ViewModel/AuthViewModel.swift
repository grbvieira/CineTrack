//
//  LoginViewModel.swift
//  CineTrack
//
//  Created by Gerson Vieira on 21/11/24.
//

import FirebaseAuth
import FirebaseFirestore

protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

protocol AuthViewModelContract {
    func signIn(withEmail email: String, password: String) async throws
    func createUser(withEmail email: String, password: String, fullName: String) async throws
    func signOut()
    func deleAccount()
    func fetchUser() async
}

@MainActor
class AuthViewModel: ObservableObject, @preconcurrency AuthViewModelContract{
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var isAlertPresent = false
    @Published var alertMessage = String()
    @Published var isLoading: Bool = false
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        Task {
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        self.isLoading = true
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            self.isLoading = false
            await fetchUser()
        } catch {
            self.isLoading = false
            self.errorSignInError(error: error)
        }
    }
    
    func createUser(withEmail email: String, password: String, fullName: String) async throws {
        self.isLoading = true
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession =  result.user
            let user = User(id: result.user.uid, fullName: fullName, email: email)
            let encoderUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encoderUser)
            self.isLoading = false
            await self.fetchUser()
        } catch {
            self.isLoading = false
            self.errorSignInError(error: error)
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.currentUser = nil
            self.userSession = nil
        } catch {
            self.errorSignInError(error: error)
        }
    }
    
    func deleAccount() {
        guard let currentUser = Auth.auth().currentUser else { return }
        
        currentUser.delete { error  in
            if let error = error {
                self.errorSignInError(error: error)
            } else {
                self.signOut()
            }
        }
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: User.self)
        
    }
}

//
//  UserManager.swift
//  CineTrack
//
//  Created by Gerson Vieira on 07/12/24.
//

import FirebaseFirestore

final class UserManager {
    
    static let shared = UserManager()
    private init() { }
    
    private let usercollection: CollectionReference = {
        return Firestore.firestore().collection("users")
    }()
    
    func createNewUser(user: UserDB) async throws {
        try getDocument(uid: user.userId).setData(from: user, merge: false)
    }
}


extension UserManager {
    private func getDocument(uid: String) -> DocumentReference {
        usercollection.document(uid)
    }
    
}

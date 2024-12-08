//
//  UserViewData.swift
//  CineTrack
//
//  Created by Gerson Vieira on 06/12/24.
//

import UIKit
import FirebaseAuth

struct AuthViewData {
    let uid: String
    let email: String?
    let photoURL: String?
    
    init(user: FirebaseAuth.User) {
        self.uid = user.uid
        self.email = user.email
        self.photoURL = user.photoURL?.absoluteString
    }
}

//
//  UserDB.swift
//  CineTrack
//
//  Created by Gerson Vieira on 07/12/24.
//

import Foundation

struct UserDB: Codable {
    let userId: String
    let email: String?
    let photoURL: String?
    
    init(auth: AuthViewData) {
        self.userId = auth.uid
        self.email = auth.email
        self.photoURL = auth.photoURL
    }
    
    init(userId: String,
         email: String? = nil,
         photoURL: String? = nil) {
        self.userId = userId
        self.email = email
        self.photoURL = photoURL
    }
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case email = "email"
        case photoURL = "photo_url"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.photoURL = try container.decodeIfPresent(String.self, forKey: .photoURL)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.userId, forKey: .userId)
        try container.encodeIfPresent(self.email, forKey: .email)
//        try container.encodeIfPresent(self.photoURL, forKey: .photoURL)
    }
}

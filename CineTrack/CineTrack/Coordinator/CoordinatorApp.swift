//
//  CoordinatorApp.swift
//  CineTrack
//
//  Created by Gerson Vieira on 28/11/24.
//

import SwiftUI
import FirebaseCore

@main
struct CoordinatorApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup{
            CoordinatorView()
        }
    }
}

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
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    var body: some Scene {
        WindowGroup{
            CoordinatorView()
        }
    }
}

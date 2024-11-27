//
//  CineTrackApp.swift
//  CineTrack
//
//  Created by Gerson Vieira on 16/11/24.
//

import SwiftUI

@main
struct CineTrackApp: App {
    
    @StateObject var viewModel: AuthViewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            StartView()
                .environmentObject(viewModel)
        }
    }
    

}

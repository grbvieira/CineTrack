//
//  CoordinatorView.swift
//  CineTrack
//
//  Created by Gerson Vieira on 28/11/24.
//

import SwiftUI

protocol userSessionProtocol {
    var isLogged: Bool { get }
    
}

struct CoordinatorView: View {
    @StateObject private var coordinator = Coordinator()
    @StateObject var viewModel: AuthViewModel = AuthViewModel()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: !isLogged ? .profile : .signIn)
                .navigationDestination(for: AppPages.self) { page in
                    coordinator.build(page: page)
                }
                .fullScreenCover(item: $coordinator.fullScreenCover) { item in
                    coordinator.buildCover(cover: item)
                }
        }
        .environmentObject(coordinator)
        .environmentObject(viewModel)
    }
}

extension CoordinatorView: userSessionProtocol {
    var isLogged: Bool {
        let user = try? AuthenticationManager.shared.getAuthenticatedUser()
        return user == nil
    }
}

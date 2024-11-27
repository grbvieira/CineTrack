//
//  ContentView.swift
//  CineTrack
//
//  Created by Gerson Vieira on 16/11/24.
//

import SwiftUI

struct StartView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                NavigationView {
                    List {
                        NavigationLink(destination: LoginAnimationView()) {
                            Text("Animar Login")
                        }
                        NavigationLink(destination: LoginView()) {
                            Text("Login Simples")
                        }
                        NavigationLink(destination: NewLoginView()) {
                            Text("Novo Login")
                        }
                    }
                    .navigationBarTitle("Escolha a Opção")
                }

            } else {
                NewLoginView()
                    .environmentObject(viewModel)
            }
        }
    }
}

#Preview {
    StartView()
}

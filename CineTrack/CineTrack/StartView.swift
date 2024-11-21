//
//  ContentView.swift
//  CineTrack
//
//  Created by Gerson Vieira on 16/11/24.
//

import SwiftUI

struct StartView: View {
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: LoginAnimationView()) {
                    Text("Animar Login")
                }
                NavigationLink(destination: LoginView()) {
                    Text("Login Simples")
                }
            }
            .navigationBarTitle("Escolha a Opção")
        }
    }
}

#Preview {
    StartView()
}

//
//  ProfileView.swift
//  CineTrack
//
//  Created by Gerson Vieira on 27/11/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    init() {
        
    }
    
    var body: some View {
        if let user = viewModel.currentUser {
            List {
                Section {
                    HStack {
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 72,height: 72)
                            .background(Color(.systemGray))
                            .clipShape(.circle)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.fullName)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            
                            Text(user.email)
                                .font(.subheadline)
                                .accentColor(.gray)
                        }
                    }
                }
                
                Section("General") {
                    HStack(spacing: 12) {
                        Image(systemName: "gear")
                            .imageScale(.small)
                            .font(.title)
                            .foregroundStyle(Color(.systemGray))
                        
                        Text("Version")
                            .font(.subheadline)
                            .accentColor(.black)
                        
                        Spacer()
                        
                        Text("1.0.0")
                            .font(.subheadline)
                            .accentColor(.gray)
                    }
                }
                
                Section("Account") {
                    Button {
                        viewModel.signOut()
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: "arrow.left.circle.fill")
                                .imageScale(.small)
                                .font(.title)
                                .foregroundStyle(Color(.systemRed))
                            
                            Text("Sign Out")
                                .font(.subheadline)
                                .accentColor(.black)
                        }
                    }
                    
                    Button {
                        viewModel.deleAccount()
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: "arrow.left.circle.fill")
                                .imageScale(.small)
                                .font(.title)
                                .foregroundStyle(Color(.systemRed))
                            
                            Text("Delete Account")
                                .font(.subheadline)
                                .accentColor(.black)
                        }
                    }
                }
            }
            
        }
    }
}
struct ProfileView_Preview: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

//
//  LogoView.swift
//  CineTrack
//
//  Created by Gerson Vieira on 22/11/24.
//

import Foundation
struct ClaqueteView: View {
    @State private var isClosed = false
    
    var body: some View {
        Image(systemName: "film")
            .resizable()
            .frame(width: 100, height: 100)
            .rotationEffect(.degrees(isClosed ? 45 : 0))
            .scaleEffect(isClosed ? 0.9 : 1)
            .animation(.easeInOut(duration: 1))
            .onTapGesture {
                withAnimation {
                    isClosed.toggle()
                }
            }
    }
}

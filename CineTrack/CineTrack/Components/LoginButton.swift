//
//  LoginButton.swift
//  CineTrack
//
//  Created by Gerson Vieira on 22/11/24.
//

import SwiftUI

struct LoginButton: View {
    let title: String
    let image: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        VStack {
            Button(action: action) {
                HStack {
                    Text(title)
                        .fontWeight(.semibold)
                    Image(systemName: image)
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 40)
            }
            .background(backgroundColor)
            .cornerRadius(10)
        }
    }
}


struct LoginButton_Preview: PreviewProvider {
    static var previews: some View {
        LoginButton(title: "Sign",
                    image: "arrow.right",
                    backgroundColor: .white) { }
    }
}

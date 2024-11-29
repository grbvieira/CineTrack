//
//  LoginButton.swift
//  CineTrack
//
//  Created by Gerson Vieira on 22/11/24.
//

import SwiftUI

struct LoginButton: View {
    let text: String
    let image: String?
    var backgroundColor: Color
    var textColor: Color
    let action: () -> Void
    
    var body: some View {
        VStack {
            Button(action: action) {
                HStack {
                    Text(text)
                        .fontWeight(.medium)
                        .foregroundStyle(textColor)
                    if let image = image  {
                        Image(systemName: image)
                            .foregroundStyle(textColor)
                    }
                }
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            }
            .background(backgroundColor)
            .cornerRadius(10)
        }
    }
}


struct LoginButton_Preview: PreviewProvider {
    static var previews: some View {
        LoginButton(text: "SignIn",
                    image: "arrow.right",
                    backgroundColor: Color(.systemBlue),
                    textColor: .white){}
    }
}

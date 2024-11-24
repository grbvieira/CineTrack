//
//  LoginButton.swift
//  CineTrack
//
//  Created by Gerson Vieira on 22/11/24.
//

import SwiftUI

struct LoginButton: View {
    let text: String
    var secondText: String = ""
    let image: String?
    var backgroundColor: Color = .clear
    var textColor: Color = .black
    let action: () -> Void
    
    var body: some View {
        VStack {
            Button(action: action) {
                HStack {
                    Text(text)
                        .fontWeight(.semibold)
                        .foregroundStyle(textColor)
                    Text(secondText)
                        .fontWeight(.bold)
                        .foregroundStyle(textColor)
                    if let image = image  {
                        Image(systemName: image)
                            .foregroundStyle(textColor)
                    }
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            }
            .background(backgroundColor)
            .cornerRadius(10)
        }
    }
}


struct LoginButton_Preview: PreviewProvider {
    static var previews: some View {
       /* LoginButton(title: "Sign",
                    image: "arrow.right",
                    backgroundColor: .blue,
                    textColor: .white) { }*/
        LoginButton(text: "Already have an account?",
                    secondText: "Sign",
                    image: nil,
                    textColor: .blue) {}
    }
}

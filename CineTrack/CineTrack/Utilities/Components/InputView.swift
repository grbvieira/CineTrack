//
//  InputView.swift
//  CineTrack
//
//  Created by Gerson Vieira on 22/11/24.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .foregroundColor(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.footnote) // #Mudar Fonte
            
            if isSecureField {
                SecureField(placeholder, text: $text)
                    .font(.system(size: 14))
            } else {
                TextField(placeholder, text: $text)
                    .font(.system(size: 14))
            }
            
            Divider()
        }
    }
}

struct InputView_Preview: PreviewProvider {
    static var previews: some View {
        InputView(text: .constant(""), title: "Email Addres", placeholder: "name@example.com")
    }
}

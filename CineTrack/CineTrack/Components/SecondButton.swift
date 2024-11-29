//
//  CustomButton.swift
//  CineTrack
//
//  Created by Gerson Vieira on 21/11/24.
//

import SwiftUI

struct CustomButton: View {
    let firstLabel: String
    let secondLabel: String
    let secondLabelIsBold: Bool
    let textColor: Color
    var action: () -> Void

    var body: some View {
        VStack {
            Button(action: action) {
                HStack(spacing: 2) {
                    Text(firstLabel)
                        .fontWeight(.medium)
                        .foregroundStyle(textColor)
                    Text(secondLabel)
                        .fontWeight(secondLabelIsBold ? .semibold : .medium)
                        .foregroundStyle(textColor)
                }
            }
        }
    }
}

struct CustomButton_Preview: PreviewProvider {
    static var previews: some View {
        CustomButton(firstLabel: "Don't have an account?",
                     secondLabel: "Sign up",
                     secondLabelIsBold: true,
                     textColor: .blue) {}
    }
}

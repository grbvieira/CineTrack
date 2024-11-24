//
//  CustomButton.swift
//  CineTrack
//
//  Created by Gerson Vieira on 21/11/24.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var width: CGFloat? = nil
    var height: CGFloat? = nil
    var gradientColors: [Color]? = nil // Permite botão sem gradiente
    var cornerRadius: CGFloat = 10
    var textColor: Color = .white
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .bold()
                .frame(
                    width: width,
                    height: height
                )
                .background(
                    gradientColors != nil
                        ? RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                            .fill(
                                LinearGradient(
                                    colors: gradientColors!,
                                    startPoint: .top,
                                    endPoint: .bottomTrailing
                                )
                            )
                        : nil // Sem fundo se não houver gradiente
                )
                .foregroundColor(textColor)
        }
    }
}


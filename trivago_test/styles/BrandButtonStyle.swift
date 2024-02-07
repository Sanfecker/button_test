//
//  BrandButtonStyle.swift
//  trivago_test
//
//  Created by Patrick on 2/5/24.
//

import Foundation
import SwiftUI


struct BrandButtonStyle: ButtonStyle {
    var type: ButtonType
    var color: Color

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.horizontal)
            .frame(height: 44)
            .background(colorStyle(isPressed: configuration.isPressed).cornerRadius(8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(color.opacity(0.7), lineWidth: 2)
            )
            .foregroundColor(type == .primary ? .white : color)
            .scaleEffect(configuration.isPressed ? 0.96 : 1)
            .animation(.easeInOut, value: configuration.isPressed)
    }
    
    func colorStyle(isPressed: Bool) -> Color {
        switch type {
        case .primary:
            return color.opacity(isPressed ? 1 : 0.7)
        case .secondary:
            return color .opacity(isPressed ? 0.3 : 0.1)
        }
    }
}

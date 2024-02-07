//
//  BrandButton.swift
//  trivago_test
//
//  Created by Patrick on 2/5/24.
//

import SwiftUI

struct BrandButton: View {
    let type: ButtonType
    let color: Color
    let disabled: Bool
    let action: () -> Void
    let label: String
    var leadingImage: Image?
    var trailingImage: Image?
    var font: Font?
    
    var buttonColor: Color {
        disabled ? .gray : color
    }
    
    var body: some View {
        Button(action: action) {
            HStack (spacing: 12) {
                leadingImage?.resizable().frame(width: 24, height: 24, alignment: .center)
                Text(label)
                trailingImage?.resizable().frame(width: 24, height: 24, alignment: .center)
            }.font(font ?? Font.headline).disabled(disabled)
        }.buttonStyle(BrandButtonStyle(type: type, color: buttonColor))
    }
}

struct BrandButton_Previews: PreviewProvider {
    static var previews: some View {
        BrandButton(
            type: .secondary,
            color: .green,
            disabled: false,
            action: {},
            label: "Click me",
            leadingImage: Image(systemName: "square"),
            trailingImage: Image(systemName: "square")
        )
    }
}

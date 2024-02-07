//
//  ContentView.swift
//  trivago_test
//
//  Created by Patrick on 2/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (spacing: 16) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            BrandButton(
                type: .primary,
                color: .green.opacity(0.1),
                disabled: false,
                action: {},
                label: "Click me"
            )
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ColorChange.swift
//  SwiftUIAnimations
//
//  Created by Aleksandr Riakhin on 12/20/23.
//

import SwiftUI

struct ColorChange: View {

    @State private var fillColor: Color = .random

    var body: some View {
        VStack(spacing: 16) {
            Text("Color: \(fillColor.description)")
                .textSelection(.enabled)
            Circle()
                .fill(fillColor)
                .animation(.default, value: fillColor)
                .frame(width: 200, height: 200)

            Button("Change color") {
                fillColor = .random
            }
        }
    }
}

#Preview {
    ColorChange()
}

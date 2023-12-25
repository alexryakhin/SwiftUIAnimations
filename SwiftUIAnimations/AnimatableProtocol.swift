//
//  AnimatableProtocol.swift
//  SwiftUIAnimations
//
//  Created by Aleksandr Riakhin on 12/25/23.
//

import SwiftUI

struct AnimatableProtocolView: View, Animatable {
    private var number: Double

    init(number: Double) {
        self.number = number
    }

    var animatableData: Double {
        // When rendering, SwiftUI detects that this view is Animatable and continues to call animableData based on the values provided by the timing curve function after the state has changed.
        get { number }
        set { number = newValue }
    }

    var body: some View {
        Text(number, format: .number.precision(.fractionLength(3)))
            .font(.title)
            .bold()
    }
}

struct AnimatableProtocolViewDemo: View {
    @State private var startAnimation = false

    var body: some View {
        VStack {
            AnimatableProtocolView(number: startAnimation ? 1 : 0) // Declare the two states
                .animation(.linear(duration: 0.5), value: startAnimation) // Associate dependencies and timing curve functions
            Button("Animate") {
                startAnimation.toggle() // Change dependencies
            }
        }
        .frame(width: 300, height: 300)
    }
}

#Preview {
    AnimatableProtocolViewDemo()
}

//
//  ScaleEffect.swift
//  SwiftUIAnimations
//
//  Created by Aleksandr Riakhin on 12/20/23.
//

import SwiftUI

struct ScaleEffect: View {

    @State private var isScaled: Bool = false
    @Namespace private var catAnimation

    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Cat Programmer")
                        .font(.title2)
                        .bold()
                    Text("Cats are natural programmers and they're always gonna help you to write the best code, and of course, they can purr")
                        .font(.caption)
                }

                Image(.cat)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 16.0))
                    .matchedGeometryEffect(id: "cat", in: catAnimation, isSource: true)
                    .onTapGesture {
                        isScaled.toggle()
                    }
            }
            .padding()
            .background(.brown.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 24.0))

            Image(.cat)
                .resizable()
                .scaledToFit()
                .scaleEffect(isScaled ? 3 : 1)
//                    .position(CGPoint(x: -proxy.frame(in: .local).midX, y: 0))
                .matchedGeometryEffect(id: "cat", in: catAnimation, isSource: false)
                .onTapGesture {
                    isScaled.toggle()
                }

        }
    }
}

#Preview {
    ScaleEffect()
}

//
//  ExpandingHeaderPictureView.swift
//  SwiftUIAnimations
//
//  Created by Aleksandr Riakhin on 12/19/23.
//

import SwiftUI

struct ExpandingHeaderPictureView: View {

    var navigationTitle = "Expanding Header"
    @State private var opacity: Double = 0
    @State private var oppositeOpasity: Double = 1

    @Environment(\.presentationMode) var presentation

    var body: some View {
        ScrollView {
            GeometryReader { geo in
                Image(.cat)
                    .resizable()
                    .scaledToFill()
                    .padding(.top, 0)
                    .frame(
                        width: UIScreen.main.bounds.width,
                        height: geo.frame(in: .global).minY > 0
                        ? geo.frame(in: .global).minY + (UIScreen.main.bounds.height / 3)
                        : UIScreen.main.bounds.height / 3
                    )
                    .offset(y: -geo.frame(in: .global).minY)
                    .opacity(oppositeOpasity)
                    .onChange(of: geo.frame(in: .global).minY) {
                        let minY = geo.frame(in: .global).minY
                        let op = (-minY - 70) / 100
                        if -minY > 70 {
                            opacity = op
                            oppositeOpasity = 1 - op
                        } else {
                            opacity = 0
                            oppositeOpasity = 1
                        }
                    }
            }

            VStack {
                //MARK: - Content
                ForEach(0..<50) { index in
                    Text("index \(index)")
                }
            }
            .frame(maxWidth: .infinity)
            .background(.background)
            .padding(.top, 270)
        }
        .background(.background)
        .toolbar(.hidden)
        .overlay (
            VStack(spacing: 0) {
                NavigationBarView(navigationTitle: navigationTitle, leftBarButton: {
                    AnyView(Button("Back") {
                        presentation.wrappedValue.dismiss()
                    })
                })
                Spacer()
            }
            .opacity(opacity)
        )
    }
}

#Preview {
    ExpandingHeaderPictureView()
}

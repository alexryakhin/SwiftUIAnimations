//
//  NavigationBarView.swift
//  SwiftUIAnimations
//
//  Created by Aleksandr Riakhin on 12/19/23.
//

import SwiftUI

struct NavigationBarView: View {
    var navigationTitle: String

    var leftBarButton: AnyView?
    var rightBarButton: AnyView?

    init(
        navigationTitle: String,
        @ViewBuilder leftBarButton: @escaping () -> AnyView? = { nil },
        @ViewBuilder rightBarButton: @escaping () -> AnyView? = { nil }
    ) {
        self.navigationTitle = navigationTitle
        self.leftBarButton = leftBarButton()
        self.rightBarButton = rightBarButton()
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                Text(navigationTitle)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .padding(10)
                Spacer()
            }
            .overlay {
                HStack {
                    if let leftBarButton {
                        leftBarButton
                    }
                    Spacer()
                    if let rightBarButton {
                        rightBarButton
                    }
                }
                .padding(.horizontal, 16)
            }
            Divider()
        }
        .background(.regularMaterial)
    }
}

#Preview {
    VStack {
        NavigationBarView(navigationTitle: "Title", rightBarButton: {
            AnyView(Text("Right"))
        })
        Spacer()
    }
}

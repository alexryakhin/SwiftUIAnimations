//
//  MainListItem.swift
//  SwiftUIAnimations
//
//  Created by Aleksandr Riakhin on 12/20/23.
//

import SwiftUI

enum MainListItem: CaseIterable {
    case colorChange
    case scaleEffect
    case animatableProtocol
    case expandingHeaderPicture

    var title: String {
        switch self {
        case .colorChange: "Color Change"
        case .scaleEffect: "Scale Effect"
        case .animatableProtocol: "Animatable Protocol"
        case .expandingHeaderPicture: "Expanding Header Picture"
        }
    }

    @ViewBuilder var view: some View {
        switch self {
        case .colorChange: ColorChange()
        case .scaleEffect: ScaleEffect()
        case .animatableProtocol: AnimatableProtocolViewDemo()
        case .expandingHeaderPicture: ExpandingHeaderPictureView(navigationTitle: title)
        }
    }
}

//
//  MainListItem.swift
//  SwiftUIAnimations
//
//  Created by Aleksandr Riakhin on 12/20/23.
//

import SwiftUI

enum MainListItem: CaseIterable {
    case colorChange
    case expandingHeaderPicture

    var title: String {
        switch self {
        case .colorChange: "Color Change"
        case .expandingHeaderPicture: "Expanding Header Picture"
        }
    }

    @ViewBuilder var view: some View {
        switch self {
        case .colorChange: ColorChange()
        case .expandingHeaderPicture: ExpandingHeaderPictureView(navigationTitle: title)
        }
    }
}

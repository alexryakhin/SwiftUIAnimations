//
//  MainListView.swift
//  SwiftUIAnimations
//
//  Created by Aleksandr Riakhin on 12/18/23.
//

import SwiftUI

struct MainListView: View {
    var body: some View {
        NavigationStack {
            List(MainListItem.allCases, id: \.self) { item in
                NavigationLink {
                    item.view
                        .navigationTitle(item.title)
                        .navigationBarTitleDisplayMode(.inline)
                } label: {
                    Text(item.title)
                }
            }
            .navigationTitle("SwiftUI Animations")
        }
    }
}

#Preview {
    MainListView()
}

enum MainListItem: CaseIterable {
    case first

    var title: String {
        switch self {
        case .first: "First"
        }
    }

    var view: some View {
        switch self {
        case .first: Text("First")
        }
    }
}

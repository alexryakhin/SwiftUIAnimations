//
//  Color+Extension.swift
//  SwiftUIAnimations
//
//  Created by Aleksandr Riakhin on 12/20/23.
//

import SwiftUI

extension Color {
    static var random: Self {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}

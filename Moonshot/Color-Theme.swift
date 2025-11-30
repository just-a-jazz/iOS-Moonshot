//
//  Color-Theme.swift
//  Moonshot
//
//  Created by Jazz Siddiqui on 2025-11-29.
//

import SwiftUI

extension ShapeStyle where Self == Color {
    static var lightBackground: Color {
        Color(red: 0.2, green: 0.2, blue: 0.3)
    }
    
    static var darkBackground: Color {
        Color(red: 0.1, green: 0.1, blue: 0.2)
    }
}

struct CustomDivider : View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

//
//  CustomModifierExample.swift
//  SeSAC4SwiftUISearchTransition
//
//  Created by Greed on 4/22/24.
//

import SwiftUI

struct PointBackgroud: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.title)
            .padding(10)
            .background(Color.red)
            .foreground(.blue)
            .clipShape(.capsule)
    }
}

extension View {
    
    func asPointBackground() -> some View {
        modifier(PointBackgroud())
    }
}

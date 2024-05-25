//
//  NavigationBarWrapper.swift
//  SeSAC4SwiftUISearchTransition
//
//  Created by Greed on 4/22/24.
//

import SwiftUI

private struct NavigationBarWrapper<L: View, T: View>: ViewModifier {
    
    let leading: L
    let trailing: T
    
    init(@ViewBuilder leading: () -> L, @ViewBuilder trailing: () -> T) {
        self.leading = leading()
        self.trailing = trailing()
    }
    
    func body(content: Content) -> some View {
        if #available(iOS 14.0, *) {
            content
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        leading
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        trailing
                    }
                }
        } else {
            content
                .navigationBarItems(leading: leading, trailing: trailing)
        }
    }
}

extension View {
    
    func navigationBar(
        @ViewBuilder leading: () -> some View,
        @ViewBuilder trailing: () -> some View)
    -> some View {
        modifier(NavigationBarWrapper(leading: leading, trailing: trailing))
    }
}

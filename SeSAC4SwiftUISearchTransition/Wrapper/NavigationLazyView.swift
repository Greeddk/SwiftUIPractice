//
//  NavigationLazyView.swift
//  SeSAC4SwiftUISearchTransition
//
//  Created by Greed on 4/23/24.
//

import SwiftUI

struct NavigationLazyView<T: View>: View {
    
    let build: () -> T
    
    init(_ build: @autoclosure @escaping () -> T) {
        self.build = build
    }
    
    var body: some View {
       build()
    }
}

//
//  SheetView.swift
//  SeSAC4SwiftUISearchTransition
//
//  Created by Greed on 4/23/24.
//

import SwiftUI

/*
 
 */
struct SheetView: View {
    
    @State private var showSheet = false
    let url = URL(string: "https://www.naver.com")!
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray.ignoresSafeArea()
                VStack {
                    NavigationLink {
                        NavigationLazyView(HomeView())
                    } label: {
                        Text("네비게이션")
                            .asPointBackground()
                    }

                    Text("Hello, World!")
                        .background(.black)
                        .foreground(.white)
                        .font(.title)
                        .wrapToButton {
                            print("clicked")
                            showSheet.toggle()
                    }
                    ShareLink(item: url) {
                        Image(systemName: "star.fill")
                    }
                }
            }
            .sheet(isPresented: $showSheet, content: {
                Text("Test")
                    .presentationDetents([.medium, .large, .height(100)])
                    .presentationDragIndicator(.hidden)
                    .interactiveDismissDisabled()
        })
        }
    }
}

extension PresentationDetent {
    static let small = Self.height(100)
}
#Preview {
    SheetView()
}

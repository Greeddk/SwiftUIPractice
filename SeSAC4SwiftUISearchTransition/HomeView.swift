//
//  HomeView.swift
//  SeSAC4SwiftUISearchTransition
//
//  Created by Greed on 4/22/24.
//

import SwiftUI

/*
 1. NavigationLink Destination 이 Push 되지 않더라도 무조건 init이 되어 버린다!
 
 2. Version 대응이 필요한 순간들이 많다
 
 3. @ViewBuilder
 */

struct HomeView: View {
    
    let url = URL(string: "https://picsum.photos/200")
    
    @ViewBuilder
    var posterImage: some View {
        if #available(iOS 15.0, *) {
            AsyncImage(url: url)
        } else {
            Rectangle()
                .background(Color.red)
        }
        
    }
    
    var sectionView: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(0..<9) { _ in
                    NavigationLink {
                        NavigationLazyView(HomeDetailView())
                    } label: {
                        posterImage
                    }
                }
            }
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(0..<5) { _ in
                    Text("첫번째 섹션")
                        .asPointBackground()
                    sectionView
                }
            }
            .background(Color.yellow)
        }
        .navigationTitle("test")
    }
    
}

struct HomeDetailView: View {
    var body: some View {
        Text("Asdf")
    }
    
    init() {
        print("HomeDetailView Init")
    }
}

#Preview {
    HomeView()
}

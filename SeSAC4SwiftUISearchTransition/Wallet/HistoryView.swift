//
//  HistoryView.swift
//  SeSAC4SwiftUISearchTransition
//
//  Created by Greed on 4/23/24.
//

import SwiftUI

struct HistoryView: View {
    
    @State var totalMoeny = 346000000
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack {
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(0..<5) { item in
                                bannerView()
                                    .containerRelativeFrame(.horizontal)
                                    .onTapGesture {
                                        let value = Int.random(in: 100...50000) * 1000
                                        totalMoeny = value
                                    }
                            }
                        }
                        .scrollTargetLayout()
                    }
                    .scrollTargetBehavior(.viewAligned) //
                    .scrollIndicators(.hidden)
                    .frame(height: 150)
                    ListView()
                }
            }
            .navigationTitle("pineApple Wallet")
            .task { //iOS15+
                
            }
            
        }
    }
    
    func bannerView() -> some View {
        ZStack {
            Rectangle()
                .fill(Color.random())
                .overlay(alignment: .leading) {
                    Circle()
                        .fill(.white.opacity(0.3))
                        .scaleEffect(1.7)
                        .offset(x: 0, y: 30.0)
                }
                .clipShape(RoundedRectangle(cornerRadius: 25))
            VStack(alignment: .leading) {
                Text("나의 소비내역")
                    .font(.callout)
                Text("\(totalMoeny.formatted())원")
                    .font(.title).bold()
            }
            .padding()
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 20)
//            .frame(maxWidth: .infinity)
    }
    
}

#Preview {
    HistoryView()
}

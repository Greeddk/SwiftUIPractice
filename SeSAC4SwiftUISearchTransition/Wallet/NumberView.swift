//
//  NumberView.swift
//  SeSAC4SwiftUISearchTransition
//
//  Created by Greed on 4/23/24.
//

import SwiftUI
/*
 NavigationView
 NavigationStack(iOS16+)
 */
struct NumberView: View {
    
    let numberArray = [1,2,3,4,5,6,7]
    
    var body: some View {
        NavigationStack {
            List(numberArray, id: \.self) { number in
                NavigationLink(value: number) {
                    Text("셀: \(number)")
                }
            }
            .navigationDestination(for: Int.self) { result in
                NumberDetailView(number: result)
            }
            .navigationTitle("asdf")
        }
    }
}

struct NumberDetailView: View {
    
    let number: Int
    
    var body: some View {
        Text("상세 화면: \(number)")
    }
}

#Preview {
    NumberView()
}

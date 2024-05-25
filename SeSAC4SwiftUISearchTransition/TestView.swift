//
//  TestView.swift
//  SeSAC4SwiftUISearchTransition
//
//  Created by Greed on 4/22/24.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        NavigationView {
            VStack {

                Text("Button")
                    .wrapToButton {
                        print("클릭1")
                    }

                Image(systemName: "star")
                    .wrapToButton {
                        print("클릭22")
                    }
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 100, height: 100)
                    .wrapToButton {
                        print("클릭333")
                    }
                
                Circle()
                    .frame(width: 100, height: 100)
                    .wrapToButton {
                        print("클릭4444")
                    }

            }
            .navigationTitle("asdf")
            .navigationBar {
                Text("asdf")
                    .wrapToButton {
                    
                    }
            } trailing: {
                Image(systemName: "star")
                    .wrapToButton {
                        
                    }
            }

        }
    }
}

#Preview {
    TestView()
}

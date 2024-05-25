//
//  ContentView.swift
//  SeSAC4SwiftUISearchTransition
//
//  Created by Greed on 4/19/24.
//

import SwiftUI
//Transition
struct ContentView: View {
    
    @State private var isFullPresented = false
    @State private var isSheetPresented = false
    @State private var isNavigationPushed = false
    
    var customButton: some View {
        HStack{
            Image(systemName: "star")
            Text("Button")
            Image(systemName: "star")
        }
    }
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    
                }, label: {
                    customButton
                })
                .padding(50)
                .background(.green)
                Button("Full Present") {
                    isFullPresented = true
                }
                .padding(50)
                .background(.yellow)
                Button("Sheet Present") {
                    isSheetPresented = true
                }
                NavigationLink("Navigation Push") {
                    NavigationPushView()
                }
            }
            .font(.title)
            .fullScreenCover(isPresented: $isFullPresented, content: {
                FullPresentView()
            })
            .sheet(isPresented: $isSheetPresented, content: {
                SheetPresentView()
            })
//            .navigationDestination(isPresented: $isNavigationPushed) {
//                NavigationPushView()
//            }
            .navigationTitle("asdf")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button {
                        print("asdf")
                    } label: {
                        Text("asdf")
                    }
                    Button {
                        print("asdf")
                    } label: {
                        Text("asdf")
                    }
                }
            }
            
        }
    }
}

struct FullPresentView: View {
    var body: some View {
        Text("FullPresentView")
    }
}
struct SheetPresentView: View {
    var body: some View {
        Text("SheetPresentView")
    }
}
struct NavigationPushView: View {
    var body: some View {
        Text("NavigationPushView")
    }
}

#Preview {
    ContentView()
}

/*
 Swift
 - Opaque Type: some / any
 - Property Wrapper: wrappedValue / projectedValue
 - var body nonmutating get
 - @State @Binding
 - SwiftUI View Rendering: body 프로퍼티 연산
 
 Modifier
 - 적용 순서
 - 우선 순위
 - ViewModifier 활용한 Custom Modifier
 버전
 - ScrollView: iOS17+
 - NavigationStack: iOS16+
 - AsyncImage: iOS15+
 - LazyVStack: iOS14+
 */

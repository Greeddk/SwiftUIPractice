//
//  CounterView.swift
//  SeSAC4SwiftUISearchTransition
//
//  Created by Greed on 4/26/24.
//

import SwiftUI

//@State > @Binding
//@StateObject > @ObservedObject

//Published, ObservableObject >> iOS17+ @Observable

//UserDefaults == @AppStorage
//Singleton == @SceneStorage
//상위뷰/하위뷰/계층관계 상관없이 다양한 위치에서 데이터 전달
//== @EnvironmetObject: 데이터 / @Environment : 환경변수(가로모드, 다크모드)

// WebView, PHPicker >>>
// SwiftUI 기반 프로젝트, UIKit 래핑? >> UIViewRepresentable
// UIKit 기반 프로젝트에 SwiftUI 넣기 >> UIHostingView

struct CounterView: View {
    
    @State private var incrementCount = 0
    
    var body: some View {
        VStack {
            MyWebView(url: "https://www.apple.com")
            Text("웹뷰 띄우기")
                .wrapToButton {
                    print("클릭")
                }
                .padding()
            Text("\(incrementCount)번 클릭")
            Text("클릭")
                .wrapToButton {
                    incrementCount += 1
                }
            ChildCounterView()
                .padding()
                .background(.yellow)
        }
    }
}

struct ChildCounterView: View {
    
    @StateObject var viewModel = ChildCounterViewModel()
    
    var body: some View {
        VStack {
            Text("\(viewModel.incrementCount)번 클릭")
            Text("클릭")
                .wrapToButton {
                    viewModel.addCount()
                }
        }
    }
}

@Observable
class ChildCounterViewModel: ObservableObject {
    
    var incrementCount = 0
    
    func addCount() {
        incrementCount += 1
    }
    
}

#Preview {
    CounterView()
}

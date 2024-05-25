//
//  ListView.swift
//  SeSAC4SwiftUISearchTransition
//
//  Created by Greed on 4/26/24.
//

import SwiftUI
//1) UI + Logic 2) State 3) View

//ObservableObject: 관찰(데이터가 달라지면 신호를 보내주기) 기능 부여
//Published: 내가 달라지면 신호를 보내줘! (state)
//StateObject: Published 데이터가 바뀌면 그 신호를 받음

//ObservedObject: 뷰가 렌더링 될 때 인스턴스가 새롭게 생성
//StateObject: 뷰 렌더링과 상관 없이 변수는 재사용
class ListViewModel: ObservableObject {
    
    @Published var money: [Money] = [Money(amount: 0, product: "그리드", category: .hobby)]
    
    func shuffleDummyData() {
        money = dummy.shuffled()
    }
        
}

struct ListView: View {
    
    @StateObject var viewModel = ListViewModel()
    
    init() {
        print("listView init")
    }
    
    var body: some View {
        LazyVStack {
            ForEach(viewModel.money, id: \.id) { item in
                rowView(item)
            }
        }
        .onAppear { //서버통신
            viewModel.shuffleDummyData()
        }
//        .refreshable { //iOS15+
//            money = dummy.shuffled()
//        }
    }
    
    func rowView(_ item: Money) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.product)
                    .fontWeight(.bold)
                Text(item.category.rawValue)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            Spacer()
            Text(item.amountFormat)
        }
        .padding(.horizontal, 30)
        .padding(.top, 20)
    }
}

#Preview {
    ListView()
}

//
//  SearchView.swift
//  SeSAC4SwiftUISearchTransition
//
//  Created by Greed on 4/19/24.
//

struct Category: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let count: Int
}

import SwiftUI
// 스릴러 액션 SF 로맨스 애니메이션
struct SearchView: View {
    
    @State private var query: String = "스릴"
    
    var filterCategory: [Category] {
        return query.isEmpty ? category : category.filter { $0.name.contains(query)}
    }
    
    let category = [
        Category(name: "스릴러", count: 1),
        Category(name: "액션", count: 2),
        Category(name: "SF", count: 3),
        Category(name: "로맨스", count: 4),
        Category(name: "애니메이션", count: 5),
    ]
    
    func setupRows(_ category: Category) -> some View {
        HStack {
            Image(systemName: "person")
            Text("\(category.name) \(category.count)")
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filterCategory, id: \.self) { value in
                    NavigationLink {
                        SearchDetailView(category: value)
                    } label: {
                        setupRows(value)
                    }
                }
            }
            .navigationTitle("영화 검색")
            .searchable(text: $query, placement: .navigationBarDrawer, prompt: "영화를 검색해보세요.")
            .onSubmit(of: .search) {
                print("asdf")
            }
        }
    }
}

struct SearchDetailView: View {
    
    let category: Category
    var body: some View {
        Text("\(category.name) \(category.count)")
    }
}

#Preview {
    SearchView()
}

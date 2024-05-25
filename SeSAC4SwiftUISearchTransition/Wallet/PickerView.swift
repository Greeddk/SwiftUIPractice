//
//  PickerView.swift
//  SeSAC4SwiftUISearchTransition
//
//  Created by Greed on 4/23/24.
//

import SwiftUI

struct PickerView: View {
    
    let apple = ["iOS", "ipadOS", "macOS", "watchOS", "visionOS"]
    
    @State var selectedIndex = "macOS"
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(apple, id: \.self) { item in
                        Text(item)
                    }
                }
                Section {
                    Picker(selection: $selectedIndex) {
                        ForEach(apple, id: \.self) { item in
                            Text(item)
                        }
                    } label: {
                        Text("greed")
                    }
                    .pickerStyle(.navigationLink)
                }
            }
        }
    }
}

#Preview {
    PickerView()
}

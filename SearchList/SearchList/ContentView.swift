//
//  ContentView.swift
//  SearchList
//
//  Created by SeongKook on 4/24/24.
//

import SwiftUI



struct ContentView: View {
    @State var searchText = ""
    let food: [Food] = Food.sampleFood
    
    var searchResults: [Food] {
        if searchText.isEmpty {
            return food
        } else {
            return food.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults, id: \.self) { food in
                    LabeledContent(food.name) {
                        Text("\(food.category.rawValue)")
                    }
                    
                }
            }
            
            .searchable(text: $searchText, prompt: "Search for a food")
            .navigationTitle("Foods")
        }
        .textInputAutocapitalization(.never) // 키보드 첫문자 소문자로
    }
}

#Preview {
    ContentView()
}

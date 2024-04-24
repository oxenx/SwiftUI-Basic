//
//  ButtonView.swift
//  Buttons
//
//  Created by SeongKook on 4/23/24.
//

import SwiftUI

struct EditButtonView: View {
    @State var animals = ["Cat", "Dogs", "Goats"]
    var body: some View {
        List {
            ForEach(animals, id: \.self) {animal in
                    Text(animal)
            }
            .onDelete(perform: removeAnimal)
        }
        .toolbar {
            EditButton()
        }
        .navigationTitle("EditButton View")
    }
    
    // IndexSet 테이블의 순번
    func removeAnimal(at offsets: IndexSet) {
        animals.remove(atOffsets: offsets)
    }
}

#Preview {
    NavigationStack {
        EditButtonView()
    }
}

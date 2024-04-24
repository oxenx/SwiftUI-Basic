//
//  ListRow.swift
//  LazyStacks
//
//  Created by SeongKook on 4/24/24.
//

import SwiftUI

struct ListRow: View {
    let id: Int
    let type: String
    
    init(id: Int, type: String) {
        print("Loading \(type) item \(id)")
        self.id = id
        self.type = type
    }
    
    var body: some View {
        Text("\(type) \(id)")
            .padding()
    }
}

#Preview {
    ListRow(id: 1, type: "Horizontal1")
}

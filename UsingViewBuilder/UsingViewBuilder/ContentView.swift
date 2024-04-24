//
//  ContentView.swift
//  UsingViewBuilder
//
//  Created by SeongKook on 4/23/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            BlueCircle {
                Text("some Text here")
                Rectangle()
                    .fill(.red)
                    .frame(width:40, height: 40)
            }
            BlueCircle {
                Text("Another example")
            }
            .border(.black, width: 2)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

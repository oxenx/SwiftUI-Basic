//
//  ContentView.swift
//  Buttons
//
//  Created by SeongKook on 4/23/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 44) {
                
                NavigationLink("Buttons") {
                    ButtonView()
                }
                NavigationLink("EditButtons") {
                    EditButtonView()
                }
                NavigationLink("MenuButtons") {
                    MenuButtonView()
                }
                NavigationLink("PasteButtons") {
                    PasteButtonView()
                }
                NavigationLink("Details about text") {
                    Text("Very long text that should not be deplayed in ad single line because it is not good design")
                        .padding()
                        .navigationTitle(Text("Detail"))
                }
            }
            .navigationTitle("Main View")
        }

    }
}

#Preview {
    ContentView()
}

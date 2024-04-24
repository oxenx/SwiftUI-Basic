//
//  ContentView.swift
//  FormattedText
//
//  Created by SeongKook on 4/23/24.
//

import SwiftUI

struct ContentView: View {
    @State private var password = "1234"
    @State private var someText = "initial text"
    var body: some View {
        VStack {
            Text("Hello, world!")
                .fontWeight(.medium)
            
            SecureField("Enter a password", text: $password)
            
            Text("password entered: \(password)")
                .italic()
            
            TextField("Enter some Text", text: $someText)
                .padding()
            
            Text(someText)
                .font(.largeTitle)
                .underline()
            
            Text("Changing text color and make it bold")
                .foregroundStyle(.blue)
                .bold()
            
            Text("Use kerning to change space between char in the text")
                .kerning(7) // 자간
                .baselineOffset(30) // 행간
            
            Text("TextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextText")
                .background(.yellow)
                .multilineTextAlignment(.trailing)
                .lineSpacing(30)
        }

    }
}

#Preview {
    ContentView()
}

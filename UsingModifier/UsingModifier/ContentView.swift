//
//  ContentView.swift
//  UsingModifier
//
//  Created by SeongKook on 4/23/24.
//

import SwiftUI

struct BackgroundStyle: ViewModifier {
    var bgColor: Color
    
    func body(content: Content) -> some View {
        content
            .frame(width: UIScreen.main.bounds.width * 0.3)
            .foregroundStyle(.white)
            .padding()
            .background(bgColor)
            .cornerRadius(20)
    }
}

extension View {
    func customBackgroundStyle(color: Color) -> some View {
        modifier(BackgroundStyle(bgColor: color))
    }
}


struct ContentView: View {
    var body: some View {
        VStack {
            // Extension 으로 직관적으로 확인하기
          Text("Perfect")
                .customBackgroundStyle(color: .green)
            // modifier 사용하기
            Text("Perfect")
                .modifier(BackgroundStyle(bgColor: .blue))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  UsingImage
//
//  Created by SeongKook on 4/23/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(.dogs1)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Image(.dogAndNature)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .overlay(Circle().stroke(.blue, lineWidth: 6))
                .shadow(radius: 10)
                .frame(width: 300, height: 200)
            
            Image(uiImage: UIImage(resource: .dog2))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
     
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

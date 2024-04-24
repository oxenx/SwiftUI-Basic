//
//  ContentView.swift
//  TheStacks
//
//  Created by SeongKook on 4/23/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("VStack Item 1")
            Text("VStack Item 2")
            Text("VStack Item 3")
            
            Spacer()
            Divider()
                .background(.black)
            Text("VStack Item4")
            
            HStack {
                Text("HStack Item01")

                Text("HStack Item02")                
 
                Text("HStack Item03")
                
               
            }
            .background(.red)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            
            
            ZStack {
                Text("ZStack Item1")
                    .padding()
                    .background(.green)
                    .opacity(0.8)
                Text("ZStack Item2")
                    .padding()
                    .background(.green)
                    .offset(x:80, y:-40)
            }
            .padding()
        }
        .background(.blue)
    }
}

#Preview {
    ContentView()
}

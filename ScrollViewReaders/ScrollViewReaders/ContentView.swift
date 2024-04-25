//
//  ContentView.swift
//  ScrollViewReaders
//
//  Created by mac on 4/25/24.
//

import SwiftUI




struct ContentView: View {
    
    // Identifiable 의 기본형이 ID -> id: Int이기 때문에 CharacterInfo.ID?사용. nil일 수도 있기 떄문에 옵셔널
    @State private var scrolledId: CharacterInfo.ID?
    
    var body: some View {
        HStack(spacing: 20) {
            VStack {
                Text("Ios 17+")
                    .foregroundStyle(.blue)
                    .font(.title)
                ScrollView {
                    Button("Go to letter Q") {
                        scrolledId = 16
                    }
                    .padding()
                    .background(.blue)
                    .tint(.yellow)
                    
                    ForEach(CharacterInfo.charArray) { image in
                        Image(systemName: image.name)
                            .font(.largeTitle)
                            .foregroundStyle(.blue)
                            .frame(width: 90, height: 90)
                            .background(.yellow)
                            .padding()
                    }
                    
                    Button ("Go to letter G") {
                        withAnimation {
                            scrolledId = 6
                        }
                    }
                    .padding()
                    .background(.blue)
                    .tint(.yellow)
                }
                .scrollPosition(id: $scrolledId)
            }
            
            VStack {
                Text("Ios 14+")
                    .foregroundStyle(.blue)
                    .font(.title)
                ScrollView {
                    ScrollViewReader { proxy in
                        Button("Go to letter Q") {
                            proxy.scrollTo(16, anchor: .top)
                        }
                        .padding()
                        .background(.yellow)
                        .tint(.blue)
                        
                        ForEach(CharacterInfo.charArray) { image in
                            Image(systemName: image.name)
                                .font(.largeTitle)
                                .foregroundStyle(.yellow)
                                .frame(width: 90, height: 90)
                                .background(.blue)
                                .padding()
                        }
                        
                        Button ("Go to letter G") {
                            withAnimation {
                                proxy.scrollTo(6, anchor: .top)
                            }
                        }
                        .padding()
                        .background(.yellow)
                        .tint(.blue)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

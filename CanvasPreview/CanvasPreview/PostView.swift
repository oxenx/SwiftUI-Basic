//
//  PostView.swift
//  CanvasPreview
//
//  Created by mac on 4/26/24.
//

import SwiftUI

struct PostView: View {
    var title: String
    var text: String
    var imageName: String
    
    var body: some View {
        GeometryReader { geomorty in
            ScrollView {
                if geomorty.size.height > geomorty.size.width {
                    VStack(spacing: 20) {
                        Image(systemName: imageName)
                            .symbolRenderingMode(.multicolor)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geomorty.size.width * 0.75)
                        VStack(alignment: .leading) {
                            Text(title)
                                .font(.title2)
                                .padding(.top)
                            Text(text)
                                .padding(.top)
                        }
                    }
                    .padding()
                } else {
                    HStack(spacing: 20) {
                        Image(systemName: imageName)
                            .symbolRenderingMode(.multicolor)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geomorty.size.height * 0.55)
                        VStack(alignment: .leading) {
                            Text(title)
                                .font(.title2)
                                .padding(.top)
                            Text(text)
                                .padding(.top)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    PostView(
        title: "Weather forcast", text: "Scattered thunderstroms. Potential for heavy rainfall. Low 68F. Winds light and variable. Chance of rain 60%", imageName: "cloud.bolt.rain"
    )
}

//
//  SecondView.swift
//  PreviewingNavigationStack
//
//  Created by mac on 4/26/24.
//

import SwiftUI

struct SecondView: View {
    var someText: String
    var body: some View {
        Text(someText)
            .navigationTitle("Seconde View")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview("SecondView") {
    NavigationStack{
        SecondView(someText: "This is secondView")
    }
}

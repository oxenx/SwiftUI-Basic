//
//  Greetings.swift
//  SwiftUItoUIKit
//
//  Created by SeongKook on 4/24/24.
//

import SwiftUI

struct Greetings: View {
    var textFromUIKit: String
    
    var body: some View {
        Text(textFromUIKit)
    }
}

#Preview {
    Greetings(textFromUIKit: "Hello, World!")
}

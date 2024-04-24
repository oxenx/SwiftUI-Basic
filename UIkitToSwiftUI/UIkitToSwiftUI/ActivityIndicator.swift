//
//  ActivityIndicator.swift
//  UIkitToSwiftUI
//
//  Created by SeongKook on 4/23/24.
//

import SwiftUI

// UIKit에 프로토콜을 SwiftUI에서 사용하기 위해 사용하는 프로토콜 UIViewRepresentable
struct ActivityIndicator: UIViewRepresentable {
    var animating: Bool
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView()
    }
    
    func updateUIView(_ activityIndicator: UIActivityIndicatorView, context: Context) {
        if animating {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
}

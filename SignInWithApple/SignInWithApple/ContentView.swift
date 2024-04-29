//
//  ContentView.swift
//  SignInWithApple
//
//  Created by mac on 4/29/24.
//

import SwiftUI
import AuthenticationServices

struct ContentView: View {
    
    @State private var userName: String = ""
    @State private var useEmail: String = ""
    
    var body: some View {
        ZStack {
            Color.white
            if userName.isEmpty {
                SignInWithAppleButton(.signIn, onRequest: onRequest, onCompletion: onCompleteion)
                    .signInWithAppleButtonStyle(.black)
                    .frame(width: 200, height: 50)
            } else {
                Text("Welcome\n\(userName), \(useEmail)")
                    .foregroundStyle(.black)
                    .font(.headline)
            }
        }
    }
    private func onRequest(_ request: ASAuthorizationAppleIDRequest) {
        request.requestedScopes = [.fullName, .email]
    }
    
    private func onCompleteion(_ result: Result<ASAuthorization, Error>) {
        switch result {
        case .success(let authResult):
            guard let credential = authResult.credential as? ASAuthorizationAppleIDCredential else { return }
        // Todo: stroe Data
        case .failure(let error):
            print("Authorization failed: " + error.localizedDescription)
        }
    }
}

#Preview {
    ContentView()
}

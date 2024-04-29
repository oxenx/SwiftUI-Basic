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
    @State private var userEmail: String = ""
    
    @AppStorage("storedName") private var storedName: String = "" {
        didSet {
            userName = storedName
        }
    }
    @AppStorage("storeDEmail") private var storedEmail: String = "" {
        didSet {
            userEmail = storedEmail
        }
    }
    @AppStorage("userID") private var userId: String = ""
    
    var body: some View {
        ZStack {
            Color.white
            if userName.isEmpty {
                SignInWithAppleButton(.signIn, onRequest: onRequest, onCompletion: onCompleteion)
                    .signInWithAppleButtonStyle(.black)
                    .frame(width: 200, height: 50)
            } else {
                Text("Welcome\n\(userName), \(userEmail)")
                    .foregroundStyle(.black)
                    .font(.headline)
            }
        }
        .task {
            await authorize()
        }
    }
    
    private func authorize() async {
        guard !userId.isEmpty else {
            userName = ""
            userEmail = ""
            return
        }
        guard let credentialState = try? await ASAuthorizationAppleIDProvider().credentialState(forUserID: userId) else {
            userName = ""
            userEmail = ""
            return
        }
        switch credentialState {
        case .authorized:
            userName = storedName
            userEmail = storedEmail
        default:
            userName = ""
            userEmail = ""
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
            storedName = credential.fullName?.givenName ?? ""
            storedEmail = credential.email ?? ""
            userId = credential.user
            
            
        case .failure(let error):
            print("Authorization failed: " + error.localizedDescription)
        }
    }
}

#Preview {
    ContentView()
}

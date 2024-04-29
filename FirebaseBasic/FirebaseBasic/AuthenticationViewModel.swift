//
//  AuthenticationViewModel.swift
//  FirebaseBasic
//
//  Created by mac on 4/29/24.
//

import Foundation
import Firebase
import GoogleSignIn
import FirebaseCore

extension UIApplication {
    static var currentRootViewController: UIViewController? {
        UIApplication.shared.connectedScenes
            .filter({ $0.activationState == .foregroundActive })
            .map({ $0 as? UIWindowScene })
            .compactMap({ $0 })
            .first?.windows
            .filter({ $0.isKeyWindow })
            .first?
            .rootViewController
    }
}

@Observable
final class AuthenticationViewModel {
    enum State {
        case busy
        case signedIn
        case signedOut
    }
    
    var state: State = .busy
    
    private var authResult: AuthDataResult? = nil
    
    var userName: String { authResult?.user.displayName ?? "" }
    var userEmail: String { authResult?.user.email ?? "" }
    var usephotoURL: URL? { authResult?.user.photoURL }
    
    func logOut() {
        GIDSignIn.sharedInstance.signOut()
        GIDSignIn.sharedInstance.disconnect()
        try? Auth.auth().signOut()
        authResult = nil
        state = .signedOut
    }
    
    // 로그인 여부 확인
    func restorePreviousSignIn() {
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if let error { print("Error: = \(error.localizedDescription)") }
            Task {
                await self.signIn(user: user)
            }
        }
    }
    
    // 구글에 로그인하는 함수
    func login() {
        state = .busy
        guard let clientID = FirebaseApp.app()?.options.clientID,
              let rootViewController = UIApplication.currentRootViewController else {
            return
        }
        
        let configuration = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = configuration
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController, hint: nil) { result, error in
            if let error { print("Error: \(error.localizedDescription)")}
            Task {
                await self.signIn(user: result?.user)
            }
        }
    }
    
    // 로그인한 구글 유저를 파이어베이스에 등록하는 것
    private func signIn(user: GIDGoogleUser?) async {
        guard let user, let idToken = user.idToken else {
            state = .signedOut
            return
        }
        let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: user.accessToken.tokenString )
        
        do {
            authResult = try await Auth.auth().signIn(with: credential)
            state = .signedIn
        } catch {
            state = .signedOut
            print("Error: \(error.localizedDescription)")
        }
    }
}

//
//  RemoteConfigApp.swift
//  RemoteConfig
//
//  Created by mac on 4/29/24.
//

import SwiftUI
import Firebase

@main
struct RemoteConfigApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

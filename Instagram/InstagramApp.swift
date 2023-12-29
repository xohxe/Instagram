//
//  InstagramApp.swift
//  Instagram
//
//  Created by 김소혜 on 12/29/23.
//

import SwiftUI
import FirebaseCore
import Firebase

@main
struct InstagramApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel.shared)
        }
    }
}

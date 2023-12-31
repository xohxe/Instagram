//
//  ContentView.swift
//  Instagram
//
//  Created by 김소혜 on 12/29/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @State var selectedIndex = 0
    
    var body: some View {
        Group {
            
            if viewModel.userSession == nil {
                LoginView()
            }
            else {
                if let user = viewModel.currentUser {
                    MainTabView(user:user, selectedIndex: $selectedIndex)
                }
            }
        }        
    }
}

//#Preview {
//    ContentView()
//}

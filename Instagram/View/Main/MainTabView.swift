//
//  MainTabView.swift
//  Instagram
//
//  Created by 김소혜 on 12/29/23.
//

import SwiftUI

struct MainTabView: View {
    let user: User
    @Binding var selectedIndex: Int
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedIndex){
                FeedView()
                    .onTapGesture{
                        selectedIndex = 0
                    }
                    .tabItem {
                        Image(systemName: "house")
                    }.tag(0)
                
                SearchView()
                    .onTapGesture{
                        selectedIndex = 1
                    }
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }.tag(1)
                
                UploadView(tabIndex: $selectedIndex)
                    .onTapGesture {
                        selectedIndex = 2
                    }
                    .tabItem {
                        Image(systemName: "plus.square")
                    }.tag(2)
                
                ReelsView()
                    .onTapGesture {
                        selectedIndex = 3
                    }
                    .tabItem {
                        Image(systemName: "video")
                    }.tag(3)
                
                ProfileView(user: user)
                    .onTapGesture {
                        selectedIndex = 4
                    }
                    .tabItem {
                        Image(systemName: "person")
                    }.tag(4)
            }
            .navigationTitle(tabTitle)
            .navigationBarItems(trailing: tabBarItem)
        }
    }
    
    
    var tabTitle: String {
        switch selectedIndex {
        case 0: return "Feed"
        case 1: return "Search"
        case 2: return "Upload"
        case 3: return "Reels"
        case 4: return "\(user.username)"
        default: return ""
        }
    }
    
    
    var tabBarItem: some View {
        switch selectedIndex {
        case 0: return AnyView(logoutButton)
        case 1: return AnyView(logoutButton)
        case 2: return AnyView(logoutButton)
        case 3: return AnyView(logoutButton)
        case 4: return AnyView(settingButton)
        default: return AnyView(logoutButton)
        }
    }
    
    var settingButton: some View{
        NavigationLink {
            SettingView()
        } label: {
            Image(systemName: "line.3.horizontal")
        }
    }
    
    var logoutButton: some View {
        Button {
            AuthViewModel.shared.signout()
        } label: {
            Text("logout")
                .foregroundStyle(Color.black)
          
        }
    }
}

//#Preview {
//    MainTabView(selectedIndex: 1)
//}

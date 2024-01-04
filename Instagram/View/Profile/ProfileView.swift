//
//  ProfileView.swift
//  Instagram
//
//  Created by 김소혜 on 12/29/23.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    @ObservedObject var viewModel: ProfileViewModel
    
    init(user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack{
                    ProfileHeaderView(viewModel: viewModel)
                    PostGridView(config: .profile(user.id ?? ""))
                }
            }
        }
    }
}

//#Preview {
//    ProfileView()
//}

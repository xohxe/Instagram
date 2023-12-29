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
        Text("\(user.fullname)")
        Text("\(user.email)")
        
      Text("프로파일")
    }
}

//#Preview {
//    ProfileView()
//}

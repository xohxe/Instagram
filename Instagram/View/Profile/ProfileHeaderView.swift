//
//  ProfileHeaderView.swift
//  Instagram
//
//  Created by 김소혜 on 12/31/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Circle()
                    .frame(width: 80, height: 80)
                
                Spacer()
                
                HStack(spacing: 16) {
                    UserStatView(value: viewModel.user.stats?.posts ?? 0, title: "게시물")
                    UserStatView(value: viewModel.user.stats?.followers ?? 0, title: "팔로워")
                    UserStatView(value: viewModel.user.stats?.following ?? 0, title: "팔로잉")
                }
            }
            
            HStack{
                Text(viewModel.user.fullname)
            }
        }
        .padding()
        
    }
}

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
                
                AsyncImage(url: URL(string: viewModel.user.profileImageUrl ?? "")){ image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width:80, height: 80)
                        .clipShape(Circle())
                    
                } placeholder: {
                    Circle()
                        .frame(width:80, height: 80)
                        .background(.gray)
                        .clipShape(Circle())
                }
                
                Spacer()
                
                HStack(spacing: 32) {
                    UserStatView(value: viewModel.user.stats?.posts ?? 0, title: "게시물")
                    UserStatView(value: viewModel.user.stats?.followers ?? 0, title: "팔로워")
                    UserStatView(value: viewModel.user.stats?.following ?? 0, title: "팔로잉")
                }
            }
                        
            VStack (alignment: .leading){
                
                Text(viewModel.user.fullname)
                Text(viewModel.user.bio ?? "")
                    .foregroundStyle(.gray)
            }
            
            ProfileActionView(viewModel: viewModel)
        }
        .padding()
        
    }
}

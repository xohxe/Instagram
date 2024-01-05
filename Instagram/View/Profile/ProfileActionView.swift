//
//  ProfileActionView.swift
//  Instagram
//
//  Created by 김소혜 on 1/2/24.
//

import Foundation
import SwiftUI

struct ProfileActionView: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    var isFollowed : Bool { return viewModel.user.isFollowed ?? false}
    @State private var showEditProfile = false
    
    var body: some View {
        if viewModel.user.isCurrentUser {
            // 내 계정일 때,
            Button(action: { showEditProfile.toggle() }, label: {
                Text("프로필 편집")
                    .font(.system(size: 14, weight: .semibold))
                    .frame(width: 360, height: 32)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray, lineWidth: 1)
                    )
            }).fullScreenCover(isPresented: $showEditProfile, content: {
                EditProfileView(user: $viewModel.user)
            })
            
        } else {
            // 다른 계정에서는 팔로우 버튼과 메시지 버튼 표시
            HStack {
                Button {
                    isFollowed ? viewModel.unfollow() : viewModel.follow()
                    print("팔로우...")
                } label: {
                    Text(isFollowed ? "팔로잉" : "팔로우")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 175, height: 32)
                        .foregroundColor(isFollowed ? .black : .white)
                        .background(isFollowed ? Color.white : Color.blue)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: isFollowed ? 1 : 0)
                        )
                        .cornerRadius(3)
                }
                
                Button{
                    
                } label: {
                    Text("메시지")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 175, height: 32)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }
                
            }
        }
    }
}

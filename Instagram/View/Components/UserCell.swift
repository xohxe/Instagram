//
//  UserCell.swift
//  Instagram
//
//  Created by 김소혜 on 12/31/23.
//

import SwiftUI

struct UserCell: View {
    
    let user: User
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: user.profileImageUrl ?? "")){ image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width:36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                
            } placeholder: {
                
                Circle()
                    .frame(width:36, height: 36)
                    .clipped()
                    .background(.gray)
                    .cornerRadius(18)
            }
            
            
            VStack(alignment: .leading) {
                Text(user.username)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(.black)
                Text(user.fullname)
                    .font(.system(size: 14, weight: .light))
                    .foregroundStyle(.black)
            }
            Spacer()
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 4)
    }
}

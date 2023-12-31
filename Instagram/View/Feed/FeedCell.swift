//
//  FeedCell.swift
//  Instagram
//
//  Created by 김소혜 on 12/31/23.
//

import SwiftUI

struct FeedCell: View {
    
    @ObservedObject var viewModel: FeedCellViewModel
    
    var didLike: Bool { return viewModel.post.didLike ?? false }
    
    init(viewModel: FeedCellViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack{
                AsyncImage(url: URL(string: viewModel.post.ownerImageUrl)){ image in
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
                        .cornerRadius(18)
                }
                
                Text(viewModel.post.ownerUsername)
                    .font(.system(size: 14, weight: .semibold))
                
            }
            .padding(.horizontal,8)
            .padding(.vertical,4)
            
            
            AsyncImage(url: URL(string: viewModel.post.imageUrl)){ image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(maxHeight:400)
                    .clipped()
                
            } placeholder: {
                Rectangle()
                    .background(.gray)
                    .frame(maxWidth:.infinity,minHeight:200, maxHeight: 400)
            }
            
            HStack (spacing: 8) {
                
                Button {
                    didLike ? viewModel.unlike() : viewModel.like()
                } label: {
                    Image(systemName: didLike ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(didLike ? .red : .black)
                        .frame(width: 22, height: 22)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "message")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.black)
                        .frame(width: 22, height: 22)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.black)
                        .frame(width: 22, height: 22)
                }
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            
            VStack {
                Text("\(viewModel.likeString)")
                    .padding(.bottom, 2)
                
                HStack {
                    Text("\(viewModel.post.ownerUsername)")
                        .font(.system(size: 15, weight: .semibold))
                    +
                    Text(" \(viewModel.post.caption)")
                        .font(.system(size: 15))
                }
                .padding(.horizontal, 8)
                
                Text(viewModel.timestampString)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    
            }
        }
    }
}

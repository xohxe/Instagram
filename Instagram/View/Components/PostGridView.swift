//
//  PostGridView.swift
//  Instagram
//
//  Created by 김소혜 on 12/31/23.
//

import SwiftUI

struct PostGridView: View {

    private let items = [GridItem(), GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    let config: PostGridConfiguration
   
    @ObservedObject var viewModel: PostGridViewModel
    
    init(config: PostGridConfiguration) {
        self.config = config
        self.viewModel = PostGridViewModel(config: config)
    }
    
    var body: some View {
        LazyVGrid(columns: items) {
            ForEach(viewModel.posts) { post in
                NavigationLink{
                    FeedCell(viewModel: FeedCellViewModel(post: post))
                } label: {
                    
                    AsyncImage(url: URL(string: post.imageUrl)){ image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: width, height: width)
                            .clipped()
                        
                    } placeholder: {
                        ProgressView()
                    }
 
                }
                
            }
        }
    }
}

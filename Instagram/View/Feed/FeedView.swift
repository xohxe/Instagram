//
//  FeedView.swift
//  Instagram
//
//  Created by 김소혜 on 12/29/23.
//

import SwiftUI

struct FeedView: View {
    
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 32) {
                ForEach(viewModel.posts) { post in
                    FeedCell(viewModel: FeedCellViewModel(post: post))
                }
            }
        }
    }
}

//#Preview {
//    FeedView()
//}

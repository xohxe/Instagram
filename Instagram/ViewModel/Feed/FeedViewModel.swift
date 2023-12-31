//
//  FeedViewModel.swift
//  Instagram
//
//  Created by 김소혜 on 12/31/23.
//

import SwiftUI

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init(){
        fetchPosts()
    }
    
    func fetchPosts() {
        COLLECTION_POSTS.order(by: "timestamp", descending: true).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap({ try? $0.data(as: Post.self) })
        }
    }
}

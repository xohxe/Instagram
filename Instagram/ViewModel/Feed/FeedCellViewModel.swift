//
//  FeedCellViewModel.swift
//  Instagram
//
//  Created by 김소혜 on 12/31/23.
//

import SwiftUI

class FeedCellViewModel: ObservableObject {
    @Published var post: Post
    
    var likeString: String {
        let label = post.likes
        return "\(label)명이 좋아합니다."
    }
    
    var timestampString: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: post.timestamp.dateValue(), to: Date()) ?? ""
    }
    
    init(post: Post) {
        self.post = post
        checkIfUserLikedPost()
    }
    
    
    func like() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }
        
        COLLECTION_POSTS.document(post.id ?? "").collection("post-likes").document(uid).setData([:]) { _ in
            COLLECTION_USERS.document(uid).collection("user-likes")
                .document(postId).setData([:]) { _ in
                    COLLECTION_POSTS.document(postId).updateData(["likes" : self.post.likes + 1])
                    self.post.didLike = true
                    self.post.likes += 1
                }
        }
    }
    
    func unlike() {
        
        guard (post.likes > 0) else { return } // 예외처리: 좋아요가 0 이하 불가
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }
        
        COLLECTION_POSTS.document(postId).collection("post-likes").document(uid).delete { _ in
            COLLECTION_USERS.document(uid).collection("user-likes").document(postId).delete { _ in
                COLLECTION_POSTS.document(postId).updateData(["likes": self.post.likes - 1])
                
                self.post.didLike = false
                self.post.likes -= 1
            }
        }
    }
    
    
    func checkIfUserLikedPost() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }
        
        COLLECTION_USERS.document(uid).collection("user-likes").document(postId)
            .getDocument{ snapshot,  _ in
                guard let didLike = snapshot?.exists else { return }
                self.post.didLike = didLike
            }
    }
    
}

//
//  Post.swift
//  Instagram
//
//  Created by 김소혜 on 12/29/23.
//

import FirebaseFirestoreSwift
import Firebase

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    let ownerUid: String
    let ownerUsername: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp // import Firebase 해줘야 작동
    let ownerImageUrl: String
    
    var didLike: Bool? = false
    var user: User?
    
}

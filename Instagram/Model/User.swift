//
//  User.swift
//  Instagram
//
//  Created by 김소혜 on 12/29/23.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable{
    let username: String
    let email: String
    let profileImageUrl: String
    let fullname: String
    @DocumentID var id: String?
    var bio: String?
    var stats: UserStats?
    var isFollowed: Bool? = false
    var isCurrentUser: Bool
}

struct UserStats: Decodable{
    var following: Int
    var posts: Int
    var followers: Int
}

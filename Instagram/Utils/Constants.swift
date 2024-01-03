//
//  Constants.swift
//  Instagram
//
//  Created by 김소혜 on 12/29/23.
//

import Firebase

let COLLECTION_USERS = Firestore.firestore().collection("users")
let COLLECTION_POSTS = Firestore.firestore().collection("posts")
let COLLECTION_FOLLOWERS = Firestore.firestore().collection("followers")
let COLLECTION_FOLLOWING = Firestore.firestore().collection("following")

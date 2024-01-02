//
//  EditProfileViewModel.swift
//  Instagram
//
//  Created by 김소혜 on 12/31/23.
//

import SwiftUI

class EditProfileViewModel: ObservableObject {
    var user: User
    @Published var uploadComplete = false
    
    init(user: User) {
        self.user = user
    }
    
    func saveUserData(_ bio: String) {
        guard let uid = user.id else { return }
        COLLECTION_USERS.document(uid).updateData(["bio": bio]) { _ in
            self.user.bio = bio
            self.uploadComplete = true
        }
        
      
    }
    
    func uploadImage(_ image: UIImage, completion: FirestoreCompletion){
        ImageUploader.uploadImage(image: image, type: .profile) { imageUrl in
            
            guard let uid = self.user.id else { return }
            
            COLLECTION_USERS.document(uid).updateData(["profileImageUrl": imageUrl]) { _ in
                    self.user.profileImageUrl = imageUrl
                
            }
        }
    }
}

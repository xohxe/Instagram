//
//  ProfileViewModel.swift
//  Instagram
//
//  Created by 김소혜 on 12/29/23.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    
}

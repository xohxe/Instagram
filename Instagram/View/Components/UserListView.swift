//
//  UserListView.swift
//  Instagram
//
//  Created by 김소혜 on 12/31/23.
//

import SwiftUI

struct UserListView: View {
    
    @ObservedObject var viewModel: SearchViewModel
    @Binding var searchText: String
    
    var users: [User] {
        return searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)
    }
    
    var body: some View {
        ScrollView {
            LazyVStack{
                ForEach(users) { user in
                    NavigationLink {
                        LazyView(ProfileView(user: user))
                    } label: {
                        UserCell(user: user)
                    }

                }
            }
            
        }
    }
}

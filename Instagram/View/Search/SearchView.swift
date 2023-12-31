//
//  SearchView.swift
//  Instagram
//
//  Created by 김소혜 on 12/29/23.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText = ""
    @State var isSearchMode = false
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText, isEditing: $isSearchMode)
                .padding()
            ZStack {
                if isSearchMode {
                   // 검색한 유저리스트 표시
                    UserListView(viewModel: viewModel,
                                 searchText: $searchText)
                } else {
                    PostGridView(config: .explore)
                }
            }
        }
    }
}

//#Preview {
//    SearchView()
//}

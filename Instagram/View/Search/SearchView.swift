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
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText, isEditing: $isSearchMode)
                .padding()
            
            ZStack {
                if isSearchMode {
                    Text("검색한 유저리스트, 키워드 보이도록")
                } else {
                    Text("포스트 보여주기")
                }
            }
        }
    }
}

//#Preview {
//    SearchView()
//}

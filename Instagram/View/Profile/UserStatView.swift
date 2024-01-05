//
//  UserStatView.swift
//  Instagram
//
//  Created by 김소혜 on 12/31/23.
//

import SwiftUI

struct UserStatView: View {
    
    let value: Int
    let title: String
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.bold14)
            Text(title)
                .font(.regular14)
        }
    }
}

//#Preview {
//    UserStatView(value: 3, title: "팔로우")
//}

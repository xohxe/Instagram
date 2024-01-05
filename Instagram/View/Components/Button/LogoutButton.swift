//
//  LogoutButton.swift
//  Instagram
//
//  Created by 김소혜 on 1/5/24.
//

import SwiftUI

struct LogoutButton: View {
    var body: some View {
        Button {
            AuthViewModel.shared.signout()
        } label: {
            Text("logout")
                .foregroundStyle(Color.black)
          
        }
    }
}

//#Preview {
//    LogoutButton()
//}

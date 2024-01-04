//
//  SettingView.swift
//  Instagram
//
//  Created by 김소혜 on 1/4/24.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        VStack {
            Button{
                AuthViewModel.shared.signout()
            } label: {
                Text("로그아웃")
            }
        }
    }
}

//#Preview {
//    SettingView()
//}

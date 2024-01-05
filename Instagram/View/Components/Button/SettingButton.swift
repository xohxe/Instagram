//
//  SettingButton.swift
//  Instagram
//
//  Created by 김소혜 on 1/5/24.
//

import SwiftUI

struct SettingButton: View {
    var body: some View {
        NavigationLink {
            SettingView()
        } label: {
            Image(systemName: "line.3.horizontal")
        }
    }
}

//#Preview {
//    SettomgButton()
//}

//
//  BackButton.swift
//  Instagram
//
//  Created by 김소혜 on 1/4/24.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View{
        Button {
            dismiss()
        } label: {
            Image(systemName: "chevron.left")
                .frame(width: 32, height: 32)
        }
    }
    
}

//#Preview {
//    BackButton()
//}

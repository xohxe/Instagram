//
//  TextArea.swift
//  Instagram
//
//  Created by 김소혜 on 12/31/23.
//

import SwiftUI

struct TextArea: View {
    
    @Binding var text: String
    let placeholder: String
    
    init(text: Binding<String>, placeholder: String) {
        self._text = text
        self.placeholder = placeholder
    }
    
    var body: some View {
        ZStack {
            if text.isEmpty {
                Text(placeholder)
            }
            TextEditor(text: $text)
        }
        
    }
}

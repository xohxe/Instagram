//
//  ContentView.swift
//  Instagram
//
//  Created by 김소혜 on 12/29/23.
//

import SwiftUI

struct ContentView: View {
    @State var selectedIndex = 0
    
    var body: some View {
        MainTabView(selectedIndex: $selectedIndex)
    }
}

#Preview {
    ContentView()
}

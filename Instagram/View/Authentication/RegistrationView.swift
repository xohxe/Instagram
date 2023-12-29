//
//  RegistrationView.swift
//  Instagram
//
//  Created by 김소혜 on 12/29/23.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var fullname = ""
    
    var body: some View {
        ZStack{
            VStack{
                TextField("전화번호, 사용자 이름 또는 이메일", text: $email)
                    .textFieldStyle(.roundedBorder)
               
                TextField("비밀번호", text: $password)
                    .textFieldStyle(.roundedBorder)
                
                TextField("닉네임", text: $username)
                    .textFieldStyle(.roundedBorder)
               
                TextField("이름", text: $fullname)
                    .textFieldStyle(.roundedBorder)
                
                Button {
                  
                } label: {
                    Text("가입")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 50)
                        .background(Color.blue)
                        .cornerRadius(8)
                        .padding()
                }
            }
            .padding()
        }
    }
}

#Preview {
    RegistrationView()
}

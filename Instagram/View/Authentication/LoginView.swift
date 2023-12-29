//
//  LoginView.swift
//  Instagram
//
//  Created by 김소혜 on 12/29/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        
            NavigationView {
                
                VStack{
                    HStack{
                        Spacer()
                        Image(systemName: "multiply")
                    }

                    Spacer()
                    
                    VStack{
                        
                        Image("instagram-logo")
                            .resizable()
                            .renderingMode(.template)
                            .scaledToFit()
                            .frame(height: 50)
                        
                        
                        VStack {
                        
                            TextField("전화번호, 사용자 이름 또는 이메일", text: $email)
                                .textFieldStyle(.roundedBorder)
                           
                            TextField("비밀번호", text: $password)
                                .textFieldStyle(.roundedBorder)
                
                            
                            Button {
                          
                                
                            } label: {
                                
                                Text("로그인")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(width: 360, height: 50)
                                    .background(Color.blue)
                                    .cornerRadius(8)
                                    .padding()
                                
                            }
                            
                            NavigationLink {
                                RegistrationView()
                            } label: {
                                Text("가입하기")
                            }

                        }
                         
                    }
                    
                    Spacer()
                }
                .padding()
            }
    }
}

#Preview {
    LoginView()
}

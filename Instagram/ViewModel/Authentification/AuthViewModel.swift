//
//  AuthViewModel.swift
//  Instagram
//
//  Created by 김소혜 on 12/29/23.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    static let shared = AuthViewModel()
    
    init(){
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            if let error = error {
                print("Login Failed \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            
            self.fetchUser()
        }
        
        print("로그인 성공")
        
    }
    
    func register(withEmail email: String, password: String,
                  fullname: String, username:String) {
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                return
            }
            
            guard let user = result?.user else { return }
            
            // 서버에 보낼 데이터 형태
            let data = ["email": email,
                        "username": username,
                        "fullname": fullname,
                        "uid": user.uid]
            
            // 서버에 데이터 전송
            COLLECTION_USERS.document(user.uid).setData(data) { _ in
                self.userSession = user
                self.fetchUser()
            }
        }
        
        print("계정생성 성공")
    }
    
    func signout() {
        
        self.userSession = nil
        try? Auth.auth().signOut()
        
        print("로그아웃 성공")
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        print("디버깅 중: uid \(uid)")
        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            
            self.currentUser = user
        }
        
        
    }
}

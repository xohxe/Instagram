//
//  EditProfileView.swift
//  Instagram
//
//  Created by 김소혜 on 1/2/24.
//

import SwiftUI

struct EditProfileView: View {
    
    @State private var bioText: String
    @ObservedObject private var viewModel: EditProfileViewModel
    @Binding var user: User
    @Environment(\.presentationMode) var mode
    
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @State var imagePickerPresented = false
    
    
    init(user: Binding<User>) {
        self._user = user
        self.viewModel = EditProfileViewModel(user: self._user.wrappedValue)
        self._bioText = State(initialValue: _user.wrappedValue.bio ?? "")
    }
    
    var body: some View {
        VStack {
            HStack {
                Button{
                    mode.wrappedValue.dismiss()
                } label: {
                    Text("취소")
                }
                
                Spacer()
                
                Button{
                    viewModel.saveUserData(bioText)
                    if let image = selectedImage {
                        viewModel.uploadImage(image){ _ in
                            self.user.profileImageUrl = viewModel.user.profileImageUrl
                            profileImage = nil
                        }
                    }
                
                } label: {
                    Text("저장")
                        .bold()
                }
                
            }.padding()
            ZStack {
                if let image = profileImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 140, height: 140)
                        .clipShape(Circle())
                        .padding()
                    
                } else {
                 
                    Button{
                        imagePickerPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage , content: {
                        ImagePicker(image: $selectedImage)
                    })
                    .padding()
                }
            }
            TextField("상세정보 작성", text: $bioText)
                .frame(width: 370, height: 200)
                .padding()
            
            Spacer()
        }
        .onReceive(viewModel.$uploadComplete, perform: { completed in
            if completed {
                self.mode.wrappedValue.dismiss()
                self.user.bio = viewModel.user.bio
            }
        })
    }
}

extension EditProfileView {
    func loadImage() {
        //viewModel.uploadImage(image)
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

//
//  UploadView.swift
//  Instagram
//
//  Created by 김소혜 on 12/29/23.
//

import SwiftUI

struct UploadView: View {
    
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var captionText = ""
    @State var imagePickerPresented = false
    @Binding var tabIndex: Int
    @ObservedObject var viewModel = UploadViewModel()
    
    var body: some View {
        VStack {
            // 이미지 선택하기 전
            if postImage == nil {
                Button {
                    imagePickerPresented.toggle()
                } label: {
                    Text("이미지 업로드")
                }.sheet(isPresented: $imagePickerPresented, onDismiss: loadImage) {
                    ImagePicker(image: $selectedImage)
                }
            }
            // 이미지 선택되면
            else if let image = postImage {
                HStack {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                    
                    TextArea(text: $captionText, placeholder: "Enter your caption")
                        .frame(height: 180)
                    
                }
                
                HStack {
                    Button {
                        captionText = " "
                        postImage = nil
                        
                        
                    } label: {
                        Text("취소")
                    }
                    Button {
                        if let image = selectedImage {
                            viewModel.uploadPost(caption: captionText, image: image) { _ in
                                captionText = " "
                                postImage = nil
                                tabIndex = 0
                            }
                        }
                        
                    } label: {
                        Text("업로드")
                        
                    }
                }
            }
            
        }
        
    }
}
extension UploadView {
    func loadImage(){
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
}

//#Preview {
//    UploadView()
//}

//
//  ProfilePhotoSelectorView.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 30/08/23.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack {
            AuthHeaderView(title: "Setup account", message: "Add a profile photo")
            profilePhotoView
            if let selectedImage = selectedImage {
                Button {
                    print("Debug: upload proile image clicked")
                    authViewModel.uploadProfileImage(selectedImage)
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(Color(.white))
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            }
            Spacer()
        }
        .ignoresSafeArea()
    }
    
    var profilePhotoView: some View {
        Button {
            showImagePicker.toggle()
        }label: {
            if let profileImage = profileImage {
                profileImage
                    .resizable()
                    .modifier(ProfileImageModifier())
            } else {
                addProfilePhotoButtonView
            }
        }
        .padding(.top, 44)
        .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
            ImagePicker(selectedImage: $selectedImage)
        }
    }
    
    var addProfilePhotoButtonView: some View {
        VStack {
            Image(systemName: "person.circle")
                .resizable()
                .renderingMode(.template)
                .modifier(ProfileImageModifier())
            
            Text("Add Photo")
                .font(.body)
                .bold()
        }
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
    
}

private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(.systemBlue))
            .scaledToFill()
            .frame(width: 180, height: 180)
            .clipShape(Circle())
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}

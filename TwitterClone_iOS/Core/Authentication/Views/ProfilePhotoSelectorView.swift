//
//  ProfilePhotoSelectorView.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 30/08/23.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    var body: some View {
        VStack {
            AuthHeaderView(
                title: "Setup account",
                message: "Add a profile photo"
            )
            
            Button {
                print("Add a pofile photo.")
            }label: {
                VStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(Color(.systemBlue))
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .padding(.top, 44)
                    
                    Text("Add Photo")
                        .font(.body)
                        .bold()
                }
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}

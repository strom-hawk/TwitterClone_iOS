//
//  NewTweetView.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 25/08/23.
//

import SwiftUI

struct NewTweetView: View {
    @State private var caption = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var newTweetViewModel = NewTweetViewModel()
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .center){
                Button{
                    presentationMode.wrappedValue.dismiss()
                }label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemBlue))
                }
                
                Spacer()
                
                Button{
                    newTweetViewModel.uploadTweet(withCaption: caption)
                }label: {
                    Text("Tweet")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(Color(.white))
                        .clipShape(Capsule())
                }
            }
            .padding(.horizontal, 16)
            
            HStack(alignment: .top){
                AppImage(imageUrl: authViewModel.currentUser?.profileImageUrl ?? "", width: 64, height: 64)
                TextArea("What's happening?", text: $caption)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 2)
            
            Spacer()
        }
        .onReceive(newTweetViewModel.$uploadTweetStatus) { success in
            if success {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}

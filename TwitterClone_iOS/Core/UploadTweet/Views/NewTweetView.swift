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
                    print("Tweet clicked")
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
                Circle()
                    .frame(width: 64, height: 64)
                    .padding(.top, 12)
                TextArea("What's happening?", text: $caption)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 2)
            
            Spacer()
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}

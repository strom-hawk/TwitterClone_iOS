//
//  TweetRowView.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 06/05/23.
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
        VStack(alignment: .leading) {
            //Profile image + user info + actionable items
            HStack(alignment: .top, spacing: 12) {
                //Profile image view.
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(.systemBlue))
                
                //Name + domain + time frame
                VStack(alignment: .leading, spacing: 4) {
                    HStack{
                        Text("Bruce Wayne")
                            .font(.subheadline)
                            .bold()
                        Text("@batman")
                            .foregroundColor(.gray)
                            .font(.caption)
                        Circle()
                            .frame(width: 5, height: 5)
                            .foregroundColor(Color(.gray))
                        Text("49w")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    Text("Bruce Wayne")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
                
            }
            HStack {
                Button {} label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                Spacer()
                Button {} label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                Spacer()
                Button {} label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                Spacer()
                Button {} label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
            }
            .padding()
        }
        Divider()
    }
}

struct TweetRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetRowView()
    }
}

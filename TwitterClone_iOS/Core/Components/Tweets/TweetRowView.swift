//
//  TweetRowView.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 06/05/23.
//

import SwiftUI

struct TweetRowView: View {
    private let tweet: Tweet
    
    init(tweet: Tweet) {
        self.tweet = tweet
    }
    
    var body: some View {
        if let user = tweet.user {
            VStack(alignment: .leading, spacing: 16) {
                HStack(alignment: .top, spacing: 12) {
                    AppImage(imageUrl: user.profileImageUrl, width: 56, height: 56)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        HStack{
                            Text(user.fullname)
                                .font(.subheadline)
                                .bold()
                            Text("@\(user.username)")
                                .foregroundColor(.gray)
                                .font(.caption)
                            Circle()
                                .frame(width: 5, height: 5)
                                .foregroundColor(Color(.gray))
                            Text("49w")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        Text(tweet.caption)
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
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
            Divider()
        }
    }
}

struct TweetRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetRowView(tweet: Tweet.getDummyTweet())
    }
}

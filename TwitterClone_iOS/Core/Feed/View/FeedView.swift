//
//  FeedView.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 06/05/23.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewFeedView = false
    @ObservedObject var feedViewModel = FeedViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack {
                    ForEach(feedViewModel.tweets, id: \.self){ tweet in
                        TweetRowView(tweet: tweet)
                    }
                }
            }
            Button {
                showNewFeedView.toggle()
            } label: {
                Image("tweet")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 50, height: 50)
                    .padding(5)
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewFeedView) {
                NewTweetView()
            }
        }
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

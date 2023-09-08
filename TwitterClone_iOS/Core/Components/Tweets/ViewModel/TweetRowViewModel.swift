//
//  TweetRowViewModel.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 07/09/23.
//

import Foundation

class TweetRowViewModel: ObservableObject {
    let tweetService = TweetService()
    @Published var tweet: Tweet
    
    init(tweet: Tweet) {
        self.tweet = tweet
        checkIfUserLikedATweet()
    }
    
    func toggleLikeTweet() {
        if(self.tweet.didLike ?? false) {
            tweetService.unLikeTweet(tweet) { status in
                self.tweet.likes -= 1
                self.tweet.didLike = false
            }
        } else {
            tweetService.likeTweet(tweet) { status in
                self.tweet.likes += 1
                self.tweet.didLike = true
            }
        }
        
        
    }
    
    func checkIfUserLikedATweet() {
        tweetService.checkIfUserLikedATweet(tweet) { liked in
            if(liked) {
                self.tweet.didLike = true
            }
        }
    }
}

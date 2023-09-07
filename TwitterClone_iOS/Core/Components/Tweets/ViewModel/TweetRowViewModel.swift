//
//  TweetRowViewModel.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 07/09/23.
//

import Foundation

class TweetRowViewModel: ObservableObject {
    let tweetService = TweetService()
    let tweet: Tweet
    
    init(tweet: Tweet) {
        self.tweet = tweet
    }
    
    func likeTweet() {
        tweetService.likeTweet()
    }
}

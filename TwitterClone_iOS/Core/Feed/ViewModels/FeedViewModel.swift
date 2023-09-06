//
//  FeedViewModel.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 06/09/23.
//

import Firebase

class FeedViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    let tweetService = TweetService()
    let userService = UserService()
    
    init() {
        getAllFeed()
    }
    
    func getAllFeed() {
        tweetService.fetchTweets() { tweets in
            self.tweets = tweets
            
            for i in 0 ..< tweets.count {
                let uid = tweets[i].uid
                
                self.userService.fetchUser(withUid: uid) { user in
                    self.tweets[i].user = user
                }
            }
        }
    }
}

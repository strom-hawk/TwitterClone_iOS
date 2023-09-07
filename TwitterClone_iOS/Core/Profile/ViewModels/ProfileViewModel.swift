//
//  ProfileViewModel.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 07/09/23.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var userProfileTweets = [Tweet]()
    
    private let tweetService = TweetService()
    let user: User
    
    init(user: User) {
        self.user = user
        self.fetchUserTweets()
    }
    
    func fetchUserTweets() {
        guard let uid = user.id else { return }
        
        tweetService.fetchTweets(forUid: uid) { tweets in
            self.userProfileTweets = tweets
            
            for i in 0 ..< self.userProfileTweets.count {
                self.userProfileTweets[i].user = self.user
            }
        }
    }
}

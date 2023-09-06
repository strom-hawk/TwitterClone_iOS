//
//  NewTweetViewModel.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 06/09/23.
//

import Foundation

class NewTweetViewModel: ObservableObject {
    @Published var uploadTweetStatus = false
    let tweetService = TweetService()
    
    func uploadTweet(withCaption caption: String) {
        tweetService.uploadTweet(caption: caption) { success in
            if success {
                self.uploadTweetStatus = true
            } else {
                
            }
        }
    }
}

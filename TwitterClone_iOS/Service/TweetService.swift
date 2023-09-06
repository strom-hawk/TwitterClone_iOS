//
//  TweetService.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 05/09/23.
//

import Firebase

struct TweetService {
    func uploadTweet(caption: String, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let data = ["uid": uid,
                    "caption": caption,
                    "likes": 0,
                    "timestamp": Timestamp(date: Date())] as [String: Any]
        
        Firestore.firestore().collection("tweets")
            .document()
            .setData(data) { error in
                if let error = error {
                    completion(false)
                    return
                }
                completion(true)
            }
    }
    
    func fetchTweets(completion: @escaping([Tweet]) -> Void) {
        var tweets = [Tweet]()
        Firestore.firestore().collection("tweets").getDocuments { snapShot, _ in
            guard let documents = snapShot?.documents else { return }
            
            documents.forEach { document in
                guard let tweet = try? document.data(as: Tweet.self) else { return }
                tweets.append(tweet)
            }
            
            completion(tweets)
        }
    }
}

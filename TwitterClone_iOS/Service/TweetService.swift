//
//  TweetService.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 05/09/23.
//

import Firebase
import FirebaseFirestoreSwift

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
        Firestore.firestore().collection("tweets")
            .order(by: "timestamp", descending: false)
            .getDocuments { snapShot, _ in
            guard let documents = snapShot?.documents else { return }
            
            documents.forEach { document in
                guard let tweet = try? document.data(as: Tweet.self) else { return }
                tweets.append(tweet)
            }
            
            completion(tweets)
        }
    }
    
    func fetchTweets(forUid uid: String, completion: @escaping([Tweet]) -> Void) {
        var tweets = [Tweet]()
        Firestore.firestore().collection("tweets")
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapShot, _ in
            guard let documents = snapShot?.documents else { return }
            
            documents.forEach { document in
                guard let tweet = try? document.data(as: Tweet.self) else { return }
                tweets.append(tweet)
            }
            
                completion(tweets.sorted(by: {$0.timestamp.dateValue() > $1.timestamp.dateValue()}))
        }
    }
    
    func likeTweet(_ tweet: Tweet, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let tweetId = tweet.id else { return }
        
        let userLikeRef = Firestore.firestore().collection("user").document(uid).collection("user_likes")
        
        Firestore.firestore().collection("tweets").document(tweetId)
            .updateData(["likes": tweet.likes + 1]) { _ in
                userLikeRef.document(tweetId).setData([:]) { error in
                    completion(true)
                }
            }
    }
    
    func unLikeTweet(_ tweet: Tweet, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let tweetId = tweet.id else { return }
        guard tweet.likes > 0 else { return }
        
        let userLikeRef = Firestore.firestore().collection("user").document(uid).collection("user_likes")
        
        Firestore.firestore().collection("tweets").document(tweetId)
            .updateData(["likes": tweet.likes - 1]) { _ in
                userLikeRef.document(tweetId).delete { error in
                    completion(true)
                }
            }
    }
    
    func checkIfUserLikedATweet(_ tweet: Tweet,completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let tweetId = tweet.id else { return }
        
        Firestore.firestore().collection("user")
            .document(uid)
            .collection("user_likes")
            .document(tweetId).getDocument { snapshot, _ in
                guard let snapshot = snapshot else { return }
                completion(snapshot.exists)
            }
    }
}

//
//  Tweet.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 06/09/23.
//

import FirebaseFirestoreSwift
import Firebase

struct Tweet: Identifiable, Decodable, Hashable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let likes: Int
    let uid: String
    
    var user: User?
}

extension Tweet {
    static func getDummyTweet() -> Tweet {
        return Tweet(
            id: "001",
            caption: "Good morning",
            timestamp: Timestamp(date: Date()),
            likes: 0,
            uid: "001"
        )
    }
}

//
//  User.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 31/08/23.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable, Hashable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
}

extension User {
    static func getDummyUser() -> User {
        return User(
            id: "001",
            username: "Dummy User",
            fullname: "Dummy User full name",
            profileImageUrl: "Dummy user profile pic url",
            email: "dummyuser@user.com"
        )
    }
}

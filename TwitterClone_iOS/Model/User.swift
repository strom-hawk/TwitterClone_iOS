//
//  User.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 31/08/23.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
}

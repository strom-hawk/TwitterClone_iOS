//
//  UserService.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 31/08/23.
//

import Firebase

struct UserService {
    func fetchUser(withUid uid: String) {
        Firestore.firestore().collection("user")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let data = snapshot?.data() else { return }
                print("Debug: data: \(data)")
            }
    }
}

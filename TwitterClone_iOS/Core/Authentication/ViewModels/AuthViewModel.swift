//
//  AuthViewModel.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 27/08/23.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUser   = false
    private var tempUserSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        print("Debug: user session: \(self.userSession?.uid)")
        print("Debug: temp user session: \(self.tempUserSession?.uid)")
        print("Debug: did authenticate user: \(self.didAuthenticateUser)")
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Debug: Failed to login. Error: \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            print("Debug: Login successful")
        }
    }
    
    func register(withEmail email: String, password: String, fullName: String, userName: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Debug: Failed to register user with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.tempUserSession = user
            
            let data = ["email": email,
                        "username": userName.lowercased(),
                        "fullname": fullName,
                        "uid": user.uid]
            
            Firestore.firestore().collection("user")
                .document(user.uid)
                .setData(data) { _ in
                    self.didAuthenticateUser = true
                }
        }
    }
    
    func signOut() {
        userSession = nil
        try?Auth.auth().signOut()
        print("Debug: signout completed")
    }
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempUserSession?.uid else { return }
        print("Debug: uid: \(uid)")

        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("user")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]) { _ in
                    self.userSession = self.tempUserSession
                    print("Debug: user session: \(self.userSession?.uid)")
                }
        }
    }
}

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
    
    init() {
        self.userSession = Auth.auth().currentUser
        print("User session is: \(self.userSession)")
    }
}

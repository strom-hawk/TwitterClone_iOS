//
//  ExploreViewModel.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 12/05/23.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var userList = [User]()
    let userService = UserService()
    
    init() {
        self.fetchAllUsers()
    }
    
    func fetchAllUsers() {
        userService.fetchUsers { users in
            self.userList = users
            
            print("Debug-----: Users: \(self.userList)")
        }
    }
}

//
//  ExploreViewModel.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 12/05/23.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published  var searchText = ""
    @Published var userList = [User]()
    
    let userService = UserService()
    var searchableUsers: [User] {
        if searchText.isEmpty {
            return userList
        } else {
            let lowerCasedQuery = searchText.lowercased()
            return userList.filter({
                $0.username.contains(lowerCasedQuery) || $0.fullname.lowercased().contains(lowerCasedQuery)
            })
        }
    }
    
    init() {
        self.fetchAllUsers()
    }
    
    func fetchAllUsers() {
        userService.fetchUsers { users in
            self.userList = users
        }
    }
}

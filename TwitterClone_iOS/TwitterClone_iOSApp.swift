//
//  TwitterClone_iOSApp.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 06/05/23.
//

import SwiftUI
import Firebase

@main
struct TwitterClone_iOSApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
            }
            .environmentObject(viewModel)
        }
    }
}

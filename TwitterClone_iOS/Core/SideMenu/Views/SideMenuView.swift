//
//  SideMenuView.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 15/05/23.
//

import SwiftUI
import Kingfisher

struct SideMenuView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 40)  {
            if let user = authViewModel.currentUser {
                userInfoView(user)
                userSideMenuOptions
            }
            Spacer()
        }
        .padding()
    }
    
    func userInfoView(_ user: User) -> some View {
        VStack(alignment: .leading) {
            AppImage(imageUrl: user.profileImageUrl, width: 48, height: 48)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(user.fullname)
                    .font(.headline)
                    .bold()
                    .foregroundColor(.black)
                
                Text("@\(user.username)")
                    .foregroundColor(.gray)
                    .font(.caption)
            }
            
            UserStatsView().padding(.vertical)
        }
    }
    
    var userSideMenuOptions: some View {
        VStack {
            ForEach(SideMenuViewModel.allCases, id: \.rawValue) { viewModel in
                if(viewModel == .profile) {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        SideMenuOptionRowView(viewModel: viewModel)
                    }
                } else if (viewModel == .logout) {
                    Button {
                        authViewModel.signOut()
                    } label: {
                        SideMenuOptionRowView(viewModel: viewModel)
                    }
                } else {
                    SideMenuOptionRowView(viewModel: viewModel)
                }
            }
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}

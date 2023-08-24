//
//  SideMenuView.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 15/05/23.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 40)  {
            userInfoView
            userSideMenuOptions
            Spacer()
        }
        .padding()
    }
    
    var userInfoView: some View {
        VStack(alignment: .leading) {
            Circle().frame(width: 50, height: 50)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("User Name")
                    .font(.headline)
                    .bold()
                    .foregroundColor(.black)
                
                Text("@user-name")
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
                    SideMenuOptionRowView(viewModel: viewModel)
                } else {
                    SideMenuOptionRowView(viewModel: viewModel)
                }
            }
        }
    }
}

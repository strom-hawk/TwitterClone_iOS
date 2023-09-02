//
//  ProfileView.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 09/05/23.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter = TweetFilterViewModel.tweets
    @Namespace var animation
    @Environment(\.presentationMode) var mode
    
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            headerView
            actionButtons
            userInfoDetails
            tweetFilterBar
            tweetsView
            Spacer()
        }
    }
}

extension ProfileView {
    //Header view for profile page.
    var headerView: some View {
        ZStack(alignment: .bottomLeading) {
            Color(.systemBlue)
                .ignoresSafeArea()
            
            VStack {
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 0, y: -20)
                }
                
                AppImage(imageUrl: user.profileImageUrl, width: 72, height: 72)
                    .offset(x: 16, y: 24)
            }
        }
        .frame(height: 96)
    }
    
    //Action buttons view.
    var actionButtons: some View {
        HStack(spacing: 12){
            Spacer()
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
            
            Button {

            } label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .bold()
                    .frame(width: 120, height: 32)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
                    .foregroundColor(.black)
            }

        }
        .padding(.trailing)
    }
    
    //User info details view.
    var userInfoDetails: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(user.fullname)
                    .font(.title2)
                    .bold()
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
                Spacer()
            }
            
            Text("@\(user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Your nightmare")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing: 24) {
                HStack(alignment: .top) {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(Color(.gray))
                    Text("Gotham, NY")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                HStack(alignment: .top) {
                    Image(systemName: "link")
                        .foregroundColor(Color(.gray))
                    Text("www.joker.com")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            
            UserStatsView().padding(.vertical)
        }
        .padding(.horizontal)
    }
    
    //Tweets filter view
    var tweetFilterBar: some View {
        HStack {
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue){ item in
                VStack {
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundColor(selectedFilter == item ? .black : .gray)
                    
                    if(selectedFilter == item) {
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    } else {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeOut) {
                        self.selectedFilter = item
                    }
                }
            }
        }
        .overlay(Divider().offset(x: 0, y: 16))
    }
    
    //Tweets View
    var tweetsView: some View {
        ScrollView {
            LazyVStack {
                ForEach(0 ... 9, id: \.self) { _ in
                    TweetRowView()
                        .padding([.leading, .trailing, .top], 16)
                }
            }
        }
    }
}

//Preview
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.getDummyUser())
    }
}

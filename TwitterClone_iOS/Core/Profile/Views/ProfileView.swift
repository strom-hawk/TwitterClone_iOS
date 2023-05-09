//
//  ProfileView.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 09/05/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            headerView
            actionButtons
            userInfoDetails
            
            
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

extension ProfileView {
    var headerView: some View {
        ZStack(alignment: .bottomLeading) {
            Color(.systemBlue)
                .ignoresSafeArea()
            
            VStack {
                Button {
                    
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 10, y: 0)
                }
                
                Circle()
                    .frame(width: 72, height: 72)
                    .offset(x: 16, y: 35)
            }
        }
        .frame(height: 96)
    }
    
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
    
    var userInfoDetails: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text("Heath Ledger")
                    .font(.title2)
                    .bold()
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
                Spacer()
            }
            
            Text("@joker")
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
            
            HStack(spacing: 24) {
                HStack(alignment: .center) {
                    Text("0")
                        .font(.subheadline)
                        .bold()
                        
                    
                    Text("Following")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                HStack(alignment: .center) {
                    Text("0")
                        .font(.subheadline)
                        .bold()
                        
                    
                    Text("Followers")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }.padding(.vertical)
        }
        .padding(.horizontal)
    }
}

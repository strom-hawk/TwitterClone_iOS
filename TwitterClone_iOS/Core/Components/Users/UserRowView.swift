//
//  UserRowView.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 12/05/23.
//

import SwiftUI

struct UserRowView: View {
    let user: User
    
    var body: some View {
        HStack(spacing: 12) {
            AppImage(imageUrl: user.profileImageUrl, width: 48, height: 48)
            VStack(alignment: .leading, spacing: 4) {
                Text(user.fullname)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.black)
                Text("@\(user.username)")
                    .foregroundColor(.gray)
                    .font(.caption)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView(user: User.getDummyUser())
    }
}

//
//  UserRowView.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 12/05/23.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .frame(width: 48, height: 48)
                .foregroundColor(Color(.systemBlue))
            VStack(alignment: .leading, spacing: 4) {
                Text("Bruce Wayne")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.black)
                Text("@batman")
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
        UserRowView()
    }
}

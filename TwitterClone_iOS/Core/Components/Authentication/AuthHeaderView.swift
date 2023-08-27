//
//  AuthHeaderView.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 27/08/23.
//

import SwiftUI

struct AuthHeaderView: View {
    let title: String
    let message: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {Spacer()}
            
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .frame(height: 260)
        .padding(.leading)
        .background(Color(.systemBlue))
        .foregroundColor(Color.white)
        .clipShape(RoundedShape(corners: .bottomRight))
    }
}

struct AuthHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AuthHeaderView(title: "Hello.", message: "Welcome Back")
    }
}

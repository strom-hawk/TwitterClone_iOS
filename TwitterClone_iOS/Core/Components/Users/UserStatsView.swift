//
//  UserStats.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 15/05/23.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
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
        }
    }
}

struct UserStats_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsView()
    }
}

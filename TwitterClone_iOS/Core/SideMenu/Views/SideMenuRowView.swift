//
//  SideMenuRowView.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 15/05/23.
//

import SwiftUI

struct SideMenuRowView: View {
    var body: some View {
        HStack {
            Image(systemName: "arrow.2.squarepath")
                .font(.subheadline)
            
            Text("Bruce Wayne")
                .font(.subheadline)
                .bold()
                .foregroundColor(.black)
            
            Spacer()
        }
    }
}

struct SideMenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuRowView()
    }
}

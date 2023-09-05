//
//  SearchView.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 05/09/23.
//

import SwiftUI

struct SearchView: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search...",text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    }
                }
        }
        .padding(.horizontal, 4)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(text: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}

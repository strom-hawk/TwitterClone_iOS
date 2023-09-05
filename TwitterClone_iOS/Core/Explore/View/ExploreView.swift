//
//  ExploreView.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 06/05/23.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var viewModel = ExploreViewModel()
    
    var body: some View {
        VStack {
            SearchView(text: $viewModel.searchText)
                .padding()
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.searchableUsers, id: \.self) { user in
                        NavigationLink {
                            ProfileView(user: user)
                        } label: {
                            UserRowView(user: user)
                        }
                    }
                }
            }
        }
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}

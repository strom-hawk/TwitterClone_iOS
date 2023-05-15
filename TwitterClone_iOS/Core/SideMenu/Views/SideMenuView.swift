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
            VStack(alignment: .leading) {
                Circle()
                    .frame(width: 50, height: 50)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Bruce Wayne")
                        .font(.headline)
                        .bold()
                        .foregroundColor(.black)
                    
                    Text("@batman")
                        .foregroundColor(.gray)
                        .font(.caption)
                }
                
                UserStatsView().padding(.vertical)
            }
            
            VStack() {
                ForEach(SideMenuViewModel.allCases, id: \.rawValue) { option in
                    HStack(spacing: 16) {
                        Image(systemName: option.imageName)
                            .font(.headline)
                            .foregroundColor(.gray)
                        
                        Text(option.title)
                            .font(.subheadline)
                        
                        Spacer()
                    }
                    .frame(height: 40)
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}

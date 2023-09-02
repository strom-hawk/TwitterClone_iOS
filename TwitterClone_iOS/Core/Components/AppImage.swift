//
//  AppImage.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 01/09/23.
//

import SwiftUI
import Kingfisher

struct AppImage: View {
    let imageUrl: String
    let width: CGFloat
    let height: CGFloat
    
    init(imageUrl: String, width: CGFloat, height: CGFloat) {
        self.imageUrl = imageUrl
        self.width = width
        self.height = height
    }
    
    var body: some View {
        KFImage(URL(string: imageUrl))
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
            .frame(width: width, height: height)
    }
}

struct AppImage_Previews: PreviewProvider {
    static var previews: some View {
        AppImage(
            imageUrl: "https://picsum.photos/200/300",
            width: 80,
            height: 80
        )
    }
}

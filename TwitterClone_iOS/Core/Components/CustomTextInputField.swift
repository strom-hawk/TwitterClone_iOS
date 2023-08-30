//
//  CustomTextInputField.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 27/08/23.
//

import SwiftUI

struct CustomTextInputField: View {
    let imageName: String
    let placeHolder: String
    var isSecureField: Bool? = false
    @Binding var text: String
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                if isSecureField ?? false {
                    SecureField(placeHolder, text: $text)
                } else {
                    TextField(placeHolder, text: $text)
                }
            }
            
            Divider()
                .foregroundColor(Color(.darkGray))
        }
    }
}

struct CustomTextInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextInputField(imageName: "envelope", placeHolder: "Email", text: .constant(""))
    }
}

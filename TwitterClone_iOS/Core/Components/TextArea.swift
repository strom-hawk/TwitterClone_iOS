//
//  TextArea.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 25/08/23.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    let placeHolder: String
    
    init(_ placeHolder: String, text: Binding<String>) {
        self.placeHolder = placeHolder
        self._text = text
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading){
            TextEditor(text: $text)
                .padding(4)
            
            if text.isEmpty {
                Text(placeHolder)
                    .foregroundColor(Color(.placeholderText))
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
            }
        }
        .font(.body)
    }
}

struct TextArea_Previews: PreviewProvider {
    @State static var text = ""
    static var previews: some View {
        TextArea("Input area place holder", text: $text)
    }
}

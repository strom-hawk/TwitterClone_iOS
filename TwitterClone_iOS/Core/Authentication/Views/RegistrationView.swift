//
//  RegistrationView.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 26/08/23.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email: String = ""
    @State private var userName: String = ""
    @State private var fullName: String = ""
    @State private var password: String = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            AuthHeaderView(title: "Get Started.", message: "Create your account")
            signUpInfoView
            signUpView
            Spacer()
            alreadyHaveAnAccountView
        }
        .ignoresSafeArea()
    }
    
    var signUpInfoView: some View {
        VStack(spacing: 40) {
            CustomTextInputField(imageName: "envelope", placeHolder: "Email", text: $email)
            
            CustomTextInputField(imageName: "person", placeHolder: "UserName", text: $userName)
            
            CustomTextInputField(imageName: "person", placeHolder: "FullName", text: $fullName)
            
            CustomTextInputField(imageName: "lock", placeHolder: "Password", text: $password)
        }
        .padding(.horizontal, 32)
        .padding(.top, 44)
    }
    
    var signUpView: some View {
        Button {
            Text("Sign up...")
        } label: {
            Text("Sign Up")
                .font(.headline)
                .foregroundColor(Color(.white))
                .frame(width: 340, height: 50)
                .background(Color(.systemBlue))
                .clipShape(Capsule())
                .padding()
        }
        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
    }
    
    var alreadyHaveAnAccountView: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            HStack{
                Text("Already have an account?")
                    .font(.footnote)
                
                Text("Sign In")
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
            .padding(.bottom, 32)
            .ignoresSafeArea()
        }
        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

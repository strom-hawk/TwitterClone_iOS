//
//  LoginView.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 26/08/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack {
            AuthHeaderView(title: "Hello.", message: "Welcome Back")
            emailPasswordView
            forgotPasswordView
            signInView
            Spacer()
            registrationView
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
    
    var emailPasswordView: some View {
        VStack(spacing: 40) {
            CustomTextInputField(imageName: "envelope", placeHolder: "Email", text: $email)
            
            CustomTextInputField(imageName: "lock", placeHolder: "Password", isSecureField: true, text: $password)
        }
        .padding(.horizontal, 32)
        .padding(.top, 44)
    }
    
    var forgotPasswordView: some View {
        HStack{
            Spacer()
            NavigationLink {
                Text("Reset Password...")
            } label: {
                Text("Forgot password?")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(.systemBlue))
                    .padding(.top)
                    .padding(.trailing, 24)
            }
        }
    }
    
    var signInView: some View {
        Button {
            authViewModel.login(withEmail: email, password: password)
        } label: {
            Text("Sign In")
                .font(.headline)
                .foregroundColor(Color(.white))
                .frame(width: 340, height: 50)
                .background(Color(.systemBlue))
                .clipShape(Capsule())
                .padding()
        }
        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
    }
    
    var registrationView: some View {
        NavigationLink {
            RegistrationView()
                .navigationBarHidden(true)
        } label: {
            HStack{
                Text("Don't have an account?")
                    .font(.footnote)
                    .foregroundColor(Color(.systemBlue))
                
                Text("Sign Up")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(.systemBlue))
            }
            .padding(.bottom, 32)
            .ignoresSafeArea()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    @State static private var email: String = ""
    @State static private var password: String = ""
    
    static var previews: some View {
        LoginView()
    }
}

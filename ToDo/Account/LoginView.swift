//
//  LoginView.swift
//  ToDo
//
//  Created by Jaime Zepeda on 10/25/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var enteredContant: String = ""
    @State private var enteredPassword: String = ""
    @State var isShowingSignUpView = false
    @State var isSignedIn = false
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                
                Text("APP LOGO")
                
                Spacer()
                
                TextField("Phone number or email", text: $enteredContant)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.leading)
                    .font(.title3)
                    .shadow(radius: 1)
                    .padding(.horizontal, 50)
                
                Spacer()
                    .frame(height: 20)
                
                SecureField("Password", text: $enteredPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.leading)
                    .font(.title3)
                    .shadow(radius: 1)
                    .padding(.horizontal, 50)
                
                Spacer()
                    .frame(height: 80)
                
                Button {
                    
                } label: {
                    Text("Log In")
                        .frame(width: 180, height: 30)
                }
                .buttonStyle(.bordered)
                .tint(.appBlack)
                
                Spacer()
                    .frame(height: 30)
                
                HStack {
                    Spacer()
                    
                    Rectangle()
                        .frame(width: 150, height: 0.5)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Text("OR")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Rectangle()
                        .frame(width: 150, height: 0.5)
                        .foregroundColor(.gray)
                    
                    Spacer()
                }
                
                Spacer()
                    .frame(height: 50)
                
                Button {
                    isSignedIn = true
                } label: {
                    Text("Continue as Guest")
                }

                Spacer()
                
                Rectangle()
                    .frame(width: .infinity, height: 0.8)
                    .foregroundColor(.gray)
                    .padding(.vertical, 10)
                
                HStack {
                    Text("Don't have an account?")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Button {
                        isShowingSignUpView = true
                    } label: {
                        Text("Sign Up")
                            .font(.subheadline)
                    }

                }
            }
            .sheet(isPresented: $isShowingSignUpView) {
                SignUpView(isShowingSignUpView: $isShowingSignUpView)
            }
            
            if isSignedIn {
                ToDoTabView()
            }
        }
    }
}

#Preview {
    LoginView()
}

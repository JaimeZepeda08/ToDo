//
//  SignUpView.swift
//  ToDo
//
//  Created by Jaime Zepeda on 10/25/23.
//

import SwiftUI

struct SignUpView: View {
    @Binding var isShowingSignUpView: Bool
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var password = ""
    @State private var email = ""
    @State private var phone = ""

    var body: some View {
        NavigationView {
            List {
                UserIconView(initials: "\(firstName.first ?? " ")\(lastName.first ?? " ")")
                    .listRowBackground(Color.clear)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Section(header: Text("Name")) {
                    HStack {
                        TextField("First", text: $firstName)
                            .multilineTextAlignment(.leading)
                            .font(.title3)
                        
                        Spacer()
                        
                        Rectangle()
                            .frame(width: 1)
                            .foregroundColor(.appGray)
                        
                        Spacer()
                        
                        TextField("Last", text: $lastName)
                            .multilineTextAlignment(.leading)
                            .font(.title3)
                    }
                }
                 
                Section(header: Text("Password")) {
                    SecureField("Password", text: $password)
                        .multilineTextAlignment(.leading)
                        .font(.title3)
                }
                    
                Section(header: Text("Contact Info")) {
                    TextField("Email", text: $email)
                        .multilineTextAlignment(.leading)
                        .font(.title3)
                    
                    TextField("Phone Number", text: $phone)
                        .multilineTextAlignment(.leading)
                        .font(.title3)
                }
                                
                Button {
                
                } label: {
                    Text("Create Account")
                        .frame(width: 180, height: 30)
                }
                .buttonStyle(.bordered)
                .tint(.black)
                .listRowBackground(Color.clear)
                .frame(maxWidth: .infinity, alignment: .center)

            }
            .navigationTitle("Sign Up")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowingSignUpView = false
                    } label: {
                        Text("Cancel")
                    }
                    .tint(.black)
                }
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(isShowingSignUpView: .constant(true))
    }
}

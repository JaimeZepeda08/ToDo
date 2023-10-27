//
//  AccountView.swift
//  ToDo
//
//  Created by Jaime Zepeda on 10/25/23.
//

import SwiftUI

struct AccountView: View {
    
    @Binding var isShowingAccountView: Bool
    @EnvironmentObject var tasks: Tasks
    
    var body: some View {
        NavigationView {
            List {
                VStack {
                    UserIconView(initials: "JZ")
                    
                    Text("Jaime Zepeda")
                        .font(.title)
                        .fontWeight(.semibold)
                }
                .listRowBackground(Color.clear)
                .frame(maxWidth: .infinity, alignment: .center)
                
                Section(header: Text("Account Info")) {
                    AccountItemView(title: "Name", imageName: "person.fill", color1: .pink, color2: .purple, content: "Jaime Zepeda")
                    
                    AccountItemView(title: "Password", imageName: "key.fill", color1: .orange, color2: .red, content: "*************")
                    
                    AccountItemView(title: "Email", imageName: "envelope.fill", color1: .teal, color2: .blue, content: "jzepedapina@gmail.com")
                }
                
                Section(header: Text("Account Statistics")) {
                    AccountItemView(title: "Tasks Completed", imageName: "list.bullet.clipboard.fill", color1: .yellow, color2: .green, content: "\(tasks.completedTasks.count)")
                }
                                
                Button {
                    
                } label: {
                    Text("Sign Out")
                        .frame(width: 180, height: 30)
                }
                .buttonStyle(.bordered)
                .tint(.red)
                .listRowBackground(Color.clear)
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .navigationTitle("Account")
            .multilineTextAlignment(.center)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowingAccountView = false
                    } label: {
                        Text("Done")
                    }
                    .tint(.black)
                }
            }
        }
    }
}

struct AccountItemView: View {
    
    var title: String
    var imageName: String
    var color1: Color
    var color2: Color
    var content: String
    
    var body: some View {
        HStack {
            Rectangle()
                .fill(LinearGradient(colors: [color1, color2], startPoint: .top, endPoint: .bottom))
                .frame(width: 35, height: 35)
                .cornerRadius(8)
                .overlay {
                    Image(systemName: imageName)
                        .foregroundColor(.white)
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 0))

            Text(title)
                .font(.subheadline)
                .fontWeight(.medium)
            
            Spacer()
            
            Text(content)
                .font(.subheadline)
                .fontWeight(.light)
                .fontWeight(.light)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    AccountView(isShowingAccountView: .constant(true))
}

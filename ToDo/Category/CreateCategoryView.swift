//
//  CreateCategoryView.swift
//  ToDo
//
//  Created by Jaime Zepeda on 10/18/23.
//

import SwiftUI

struct CreateCategoryView: View {
    
    @EnvironmentObject var categories: Categories
    @Binding var isCreatingCategory: Bool
    @State private var enteredName: String = ""
    let characterLimit = 16
    @State private var selectedColor: Color = Color.appDarkGray
    
    let columns: [GridItem] = [GridItem(), GridItem(), GridItem(), GridItem()]
    let colors: [Color] = [.appRed, .appRed2, .appOrange, .appYellow, .appGreen, .appGreen2, .appBlue, .appBlue2, .appPurple, .appPurple2, .appPink, .appBrown]

    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Title  (Limit: \(characterLimit) characters)", text: $enteredName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.leading)
                    .font(.title3)
                    .fontWeight(.medium)
                    .shadow(radius: 1)
                    .padding(30)
                    .onReceive(enteredName.publisher.collect()) { characters in
                        if characters.count > characterLimit {
                            enteredName = String(characters.prefix(characterLimit))
                        }
                    }
                
                LazyVGrid(columns: columns) {
                    ForEach(colors, id: \.self) { color in
                        Rectangle()
                            .foregroundColor(color)
                            .frame(width: 50, height: 50)
                            .cornerRadius(8)
                            .shadow(radius: color == selectedColor ? 8 : 2, x: 0, y: color == selectedColor ? 5 : 1)
                            .scaleEffect(color == selectedColor ? 1.2 : 1.0)
                            .onTapGesture {
                                selectedColor = color
                            }
                            .padding(10)
                        
                    }
                }
                .padding(.horizontal, 50)
                
                Spacer()
            }
            .navigationTitle("New Category")
            .multilineTextAlignment(.center)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isCreatingCategory = false
                    } label: {
                        Text("Cancel")
                    }
                    .tint(.black)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        categories.addCategory(category: createCategory())
                        isCreatingCategory = false
                    } label: {
                        Text("Add")
                    }
                    .tint(.black)
                    .disabled(enteredName == "")
                }
            }
        }
    }
    
    func createCategory() -> Category {
        return Category(name: enteredName, color: selectedColor)
    }
}

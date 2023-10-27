//
//  AddButtonView.swift
//  ToDo
//
//  Created by Jaime Zepeda on 10/18/23.
//

import SwiftUI

struct AddButtonView: View {
    
    @Binding var varToSetTrue: Bool
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                
                Button {
                   varToSetTrue = true
                } label: {
                    Circle()
                        .foregroundColor(.appDarkGray)
                        .frame(width: 70, height: 70)
                        .overlay {
                            Image(systemName: "plus")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        }
                        .shadow(radius: 2, x: 0, y: 1)
                }
            }
        }
        .padding(30)
    }
}

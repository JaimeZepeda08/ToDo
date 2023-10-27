//
//  UserIconView.swift
//  ToDo
//
//  Created by Jaime Zepeda on 10/25/23.
//

import SwiftUI

struct UserIconView: View {
    
    var initials: String
    var size: CGFloat = nil ?? 90
    
    var body: some View {
        Circle()
            .fill(LinearGradient(colors: [.appGray, .gray], startPoint: .top, endPoint: .bottom))
            .frame(width: size, height: size)
            .overlay {
                if size < 90 {
                    Text(initials)
                        .foregroundColor(.white)
                        .font(.headline)
                        .fontWeight(.semibold)
                } else {
                    Text(initials)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
            }
    }
}

#Preview {
    UserIconView(initials: "JZ")
}

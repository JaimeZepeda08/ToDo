//
//  NoTasksView.swift
//  ToDo
//
//  Created by Jaime Zepeda on 10/24/23.
//

import SwiftUI

struct NoTasksView: View {
    
    var subText: String
    
    var body: some View {
        VStack{
            Image(systemName: "tray.fill")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50,  height: 50)
                .opacity(0.3)
            
            Text("No Tasks")
                .font(.title)
                .fontWeight(.bold)
                .opacity(0.3)
            
            Text(subText)
                .font(.subheadline)
                .fontWeight(.light)
                .opacity(0.4)
        }
    }
}

#Preview {
    NoTasksView(subText: "Tasks created will appear here.")
}

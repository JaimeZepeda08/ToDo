//
//  CategoryFolderView.swift
//  ToDo
//
//  Created by Jaime Zepeda on 10/18/23.
//

import SwiftUI

struct CategoryFolderView: View {
    
    var category: Category
    @EnvironmentObject var categories: Categories
    
    var body: some View {
        VStack {
            Image(systemName: "folder.fill")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .foregroundColor(category.color)
                .frame(width: 80, height: 80)
            
            Text(category.name)
                .font(.headline)
                .fontWeight(.semibold)
            
            Text("\(categories.categoryTasksDictionary[category]?.count ?? 0) items")
                .font(.caption)
                .fontWeight(.light)
        }
        .frame(maxWidth: 130)
    }
}

#Preview {
    CategoryFolderView(category: DefaultCategory.OTHER)
}

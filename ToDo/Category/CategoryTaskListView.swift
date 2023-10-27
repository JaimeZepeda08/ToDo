//
//  CategoryTaskListView.swift
//  ToDo
//
//  Created by Jaime Zepeda on 10/24/23.
//

import SwiftUI

struct CategoryTaskListView: View {
    
    var category: Category
    @EnvironmentObject var categories: Categories
    
    var body: some View {
        ZStack {
            if categories.categoryTasksDictionary[category]!.isEmpty {
                NoTasksView(subText: "\(category.name) tasks will appear here.")
                    .offset(y: -30)
            }
            
            ScrollView {
                VStack(spacing: 15) {
                    ForEach(categories.categoryTasksDictionary[category]!) { task in
                        TaskCellView(task: task)
                            .padding(.horizontal)
                    }
                }
            }
            .padding(.top)
            .navigationTitle(category.name)
        }
    }
}

#Preview {
    CategoryTaskListView(category: DefaultCategory.OTHER)
}

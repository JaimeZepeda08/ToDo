//
//  ContentView.swift
//  ToDo
//
//  Created by Jaime Zepeda on 10/18/23.
//

import SwiftUI

struct ToDoTabView: View {
    
    @EnvironmentObject var tasks: Tasks
    
    var body: some View {
        TabView() {
            TaskListView()
                .tabItem {
                    HStack {
                        Image(systemName: "list.bullet.clipboard")
                        Text("Tasks")
                    }
                }
                .badge(tasks.tasksList.count)
            
            CategoryView()
                .tabItem {
                    HStack {
                        Image(systemName: "folder")
                        Text("Categories")
                    }
                }
            
            TodaysTasksView()
                .tabItem {
                    HStack {
                        Image(systemName: "calendar.badge.clock")
                        Text("Today")
                    }
                }
                .badge(tasks.todaysTasksSet.count)
        }
        .accentColor(.black)
    }
}

#Preview {
    ToDoTabView()
}

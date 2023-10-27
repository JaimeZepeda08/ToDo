//
//  ToDoApp.swift
//  ToDo
//
//  Created by Jaime Zepeda on 10/18/23.
//

import SwiftUI

@main
struct ToDoApp: App {
    
    @StateObject var tasks = Tasks()
    @StateObject var categories = Categories()
    
    var body: some Scene {
        WindowGroup {
            ToDoTabView()
                .environmentObject(tasks)
                .environmentObject(categories)
        }
    }
}

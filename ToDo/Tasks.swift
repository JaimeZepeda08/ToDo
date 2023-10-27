//
//  TaskViewModel.swift
//  ToDo
//
//  Created by Jaime Zepeda on 10/18/23.
//

import SwiftUI

final class Tasks: ObservableObject {
    @Published var tasksList: [Task] = []
    
    func addTask(task: Task) {
        tasksList.append(task)
    }
}

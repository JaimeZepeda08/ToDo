//
//  Task.swift
//  ToDo
//
//  Created by Jaime Zepeda on 10/18/23.
//

import SwiftUI

struct Task: Identifiable, Hashable {
    var id = UUID()
    var description: String
    var category: Category
    var date: Date
    
    func compareTo(other: Task) -> Int{
        if Calendar(identifier: .gregorian).compare(date, to: other.date, toGranularity: .day) == .orderedAscending {
            return -1
        } else if Calendar(identifier: .gregorian).compare(date, to: other.date, toGranularity: .day) == .orderedSame {
            return 0
        } else {
            return 1
        }
    }
}

final class Tasks: ObservableObject {
    
    @Published var tasksList: [Task] = []
    @Published var todaysTasksSet: Set<Task> = []
    @Published var todaysTaskList: [Task] = []
    @Published var completedTasks: [Task] = []
    
    func addTask(task: Task) {
        var inserted: Bool = false
        
        for other in tasksList {
            if task.compareTo(other: other) <= 0 {
                tasksList.insert(task, at: tasksList.firstIndex(of: other)!)
                inserted = true
                break
            }
        }
        
        if !inserted {
            tasksList.append(task)
        }
    }
    
    func deleteTask(task: Task) {
        tasksList.remove(at: tasksList.firstIndex(of: task)!)
        if (todaysTasksSet.contains(task)) {
            todaysTasksSet.remove(task)
            todaysTaskList.remove(at: todaysTaskList.firstIndex(of: task)!)
        }
    }
    
    func addToTodaysTasks(task: Task) {
        if !todaysTasksSet.contains(task) {
            todaysTasksSet.insert(task)
            todaysTaskList.append(task)
        }
    }
    
    func removeTask(task: Task) {
        todaysTasksSet.remove(task)
        todaysTaskList.remove(at: todaysTaskList.firstIndex(of: task)!)
    }
    
    func completeTask(task: Task) {
        completedTasks.append(task)
        deleteTask(task: task)
    }
    
    func moveUp(task: Task) {
        if let currentIndex = todaysTaskList.firstIndex(of: task), currentIndex > 0 {
            let newIndex = currentIndex - 1
            todaysTaskList.swapAt(currentIndex, newIndex)
        }
    }
    
    func moveDown(task: Task) {
        if let currentIndex = todaysTaskList.firstIndex(of: task), currentIndex < todaysTaskList.count - 1 {
            let newIndex = currentIndex + 1
            todaysTaskList.swapAt(currentIndex, newIndex)
        }
    }
}

struct MockData {
    static let sampleTask = Task(description: "description description description description", category: DefaultCategory.OTHER, date: Date())
}

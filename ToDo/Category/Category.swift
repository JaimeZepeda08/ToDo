//
//  Category.swift
//  ToDo
//
//  Created by Jaime Zepeda on 10/18/23.
//

import SwiftUI

struct Category: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var color: Color
}

final class Categories: ObservableObject {
    
    @Published var categoriesDictionary: Dictionary<String, Category> = ["OTHER" : DefaultCategory.OTHER]
    @Published var categoryTasksDictionary: Dictionary<Category, [Task]> = [DefaultCategory.OTHER : []]
    
    func addCategory(category: Category) {
        if !categoriesDictionary.keys.contains(category.name) {
            categoriesDictionary[category.name] = category
            categoryTasksDictionary[category] = []
        }
    }
    
    func get(name: String) -> Category {
        return categoriesDictionary[name]!
    }
    
    func getNames() -> [String] {
        return Array(categoriesDictionary.keys)
    }
    
    func getCategories() -> [Category] {
        return Array(categoriesDictionary.values)
    }
    
    func addTaskToCategory(category: Category, task: Task) {
        categoryTasksDictionary[category]!.append(task)
    }
    
    func deleteTaskFromCategory(task: Task) {
        categoryTasksDictionary[task.category]!.remove(at: categoryTasksDictionary[task.category]!.firstIndex(of: task)!)
    }
}

struct DefaultCategory {
    static var OTHER = Category(name: "OTHER", color: Color.appDarkGray)
}

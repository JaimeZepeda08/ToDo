//
//  CreateTaskView.swift
//  ToDo
//
//  Created by Jaime Zepeda on 10/18/23.
//

import SwiftUI

struct CreateTaskView: View {
        
    @EnvironmentObject var tasks: Tasks
    @EnvironmentObject var categories: Categories
    @Binding var isCreatingTask: Bool
    @State private var enteredDescription: String = ""
    let characterLimit = 140
    @State private var selectedDate = Date()
    @State private var selectedCategory = "OTHER"
        
    var body: some View {
        NavigationView {
            VStack {
                TextField("Description (Limit: \(characterLimit) characters)", text: $enteredDescription)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.leading)
                    .font(.title3)
                    .fontWeight(.medium)
                    .shadow(radius: 1)
                    .padding(30)
                    .onReceive(enteredDescription.publisher.collect()) { characters in
                        if characters.count > characterLimit {
                            enteredDescription = String(characters.prefix(characterLimit))
                        }
                    }
                    
                let categoriesList = categories.getNames()
                Picker("Select an Option", selection: $selectedCategory) {
                    ForEach(categoriesList, id: \.self) {
                        Text($0)
                            .foregroundColor(.appBlack)
                    }
                }
                .pickerStyle(.wheel)
                .padding()
        
                DatePicker("Select a date", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(.graphical)
                        .padding(30)
                        .tint(.appBlack)
                
                Spacer()
            }
            .navigationTitle("New Task")
            .multilineTextAlignment(.center)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isCreatingTask = false
                    } label: {
                        Text("Cancel")
                    }
                    .tint(.black)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        tasks.addTask(task: createTask())
                        isCreatingTask = false
                    } label: {
                        Text("Add")
                    }
                    .tint(.black)
                    .disabled(enteredDescription == "")
                }
            }
        }
    }
    
    func createTask() -> Task {
        let task = Task(description: enteredDescription, category: categories.get(name: selectedCategory), date: selectedDate)
        categories.addTaskToCategory(category: task.category, task: task)
        return task
    }
}

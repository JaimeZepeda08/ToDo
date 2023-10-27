//
//  TaskCellView.swift
//  ToDo
//
//  Created by Jaime Zepeda on 10/18/23.
//

import SwiftUI

struct TaskCellView: View {
    
    var task: Task
    @EnvironmentObject var tasks: Tasks
    @EnvironmentObject var categories: Categories

    var body: some View {
        Rectangle()
            .foregroundColor(task.category.color)
            .frame(width: 320, height: 100)
            .overlay {
                ZStack {
                    VStack {
                        Spacer()
                        
                        HStack {
                            Text(task.category.name)
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.leading, 20)
                            
                            Spacer()
                        }
                        
                        Spacer()
                            .frame(height: 10)
                             
                        HStack {
                            Text(task.description)
                                .foregroundColor(.appBlack)
                                .padding(.horizontal, 30)
                                .lineLimit(1)
                                .truncationMode(.tail)
                            
                            Spacer()
                        }
                        
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        
                        VStack {
                            Button {
                                tasks.completeTask(task: task)
                                categories.deleteTaskFromCategory(task: task)
                            } label: {
                                Text("Done")
                            }
                            .buttonStyle(.bordered)
                            .tint(.black)
                            .padding(8)
                            
                            Spacer()
                        }
                    }
                }
            }
            .cornerRadius(8)
    }
}

#Preview {
    TaskCellView(task: MockData.sampleTask)
}

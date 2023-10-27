//
//  TaskDetailView.swift
//  ToDo
//
//  Created by Jaime Zepeda on 10/18/23.
//

import SwiftUI

struct TaskDetailView: View {
    
    var task: Task
    @EnvironmentObject var tasks: Tasks
    @EnvironmentObject var categories: Categories
    @Binding var isShowingDetailView: Bool
    @State private var isExpanded = false
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd"
        return dateFormatter.string(from: task.date)
    }
    
    var body: some View {
        ZStack {            
            Rectangle()
                .frame(width: 320, height: isExpanded ? 400 : 0)
                .foregroundColor(.appGray)
                .overlay {
                    VStack {
                        Rectangle()
                            .frame(width: 320, height: 80)
                            .foregroundColor(task.category.color)
                            .overlay {
                                ZStack {
                                    Text(task.category.name)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                    
                                    VStack {
                                        HStack {
                                            Spacer()
                                            
                                            Button {
                                                    isShowingDetailView = false
                                            } label: {
                                                Image(systemName: "xmark")
                                                    .foregroundColor(.appBlack)
                                                    .fontWeight(.black)
                                            }
                                        }
                                        
                                        Spacer()
                                    }
                                    .padding(20)
                                }
                            }
                        
                        if task.description.count <= 100 {
                            Text(task.description)
                                .font(.title3)
                                .fontWeight(.light)
                                .padding(.top)
                                .padding(.horizontal)
                        } else {
                            Text(task.description)
                                .font(.headline)
                                .fontWeight(.light)
                                .padding(.top)
                                .padding(.horizontal)
                        }
                        
                        Spacer()
                                                
                        Image(systemName: "note")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 70, height: 70)
                            .foregroundColor(.appBlack)
                            .overlay {
                                Text("\(formattedDate)")
                                    .multilineTextAlignment(.center)
                                    .fontWeight(.medium)
                                    .padding(.top, 8)
                            }
                                                
                        Button {
                            tasks.addToTodaysTasks(task: task)
                            isShowingDetailView = false
                        } label: {
                            Label("Add to Today's Tasks", systemImage: "calendar.badge.plus")
                        }
                        .buttonStyle(.bordered)
                        .tint(.appBlack)
                                                                        
                        HStack {
                            Spacer()
                            
                            Button {
                                isShowingDetailView = false
                            } label: {
                                Label("Edit", systemImage: "pencil")
                            }
                            .buttonStyle(.bordered)
                            .tint(.blue)
                            
                            Spacer()
                            
                            Button {
                                tasks.deleteTask(task: task)
                                categories.deleteTaskFromCategory(task: task)
                                isShowingDetailView = false
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                            .buttonStyle(.bordered)
                            .tint(.red)
                            
                            Spacer()
                        }
                        
                        Spacer()
                            .frame(height: 20)
                    }
                }
                .cornerRadius(10)
                .shadow(radius: 3, x: 0, y: 2)
        }
        .onAppear {
            withAnimation {
                isExpanded = true
            }
        }
    }
}

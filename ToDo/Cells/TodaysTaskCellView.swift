//
//  TodaysTaskCellView.swift
//  ToDo
//
//  Created by Jaime Zepeda on 10/20/23.
//

import SwiftUI

struct TodaysTaskCellView: View {
    
    var task: Task
    @EnvironmentObject var tasks: Tasks
    @EnvironmentObject var categories: Categories

    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .foregroundColor(task.category.color)
                    .frame(width: 300, height: 100)
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
                                        withAnimation {
                                            tasks.completeTask(task: task)
                                            categories.deleteTaskFromCategory(task: task)
                                        }
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
                    .shadow(radius: 2, x: 0, y: 1)
                
                Button {
                    withAnimation {
                        tasks.removeTask(task: task)
                    }
                } label: {
                    Image(systemName: "xmark")
                        .font(.subheadline)
                        .fontWeight(.bold)
                }
                .buttonStyle(.borderedProminent)
                .tint(.appBlack)
                .offset(x: -140, y: -42)
            }
            
            VStack {
                Button {
                    withAnimation {
                        tasks.moveUp(task: task)
                    }
                } label: {
                    Image(systemName: "chevron.up.square.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(task.category.color)
                }
                
                Button {
                    withAnimation {
                        tasks.moveDown(task: task)
                    }
                } label: {
                    Image(systemName: "chevron.down.square.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(task.category.color)
                }
            }
        }
    }
}



#Preview {
    TodaysTaskCellView(task: MockData.sampleTask)
}

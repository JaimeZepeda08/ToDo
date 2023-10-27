//
//  TaskListView.swift
//  ToDo
//
//  Created by Jaime Zepeda on 10/18/23.
//

import SwiftUI

struct TaskListView: View {
    
    @EnvironmentObject var tasks: Tasks
    @State private var isShowingStatsView = false
    @State private var isShowingSettingsView = false
    @State private var isCreatingTask: Bool = false
    @State private var isShowingDetailView: Bool = false
    @State private var selectedTask: Task?
    
    var body: some View {
        ZStack {
            NavigationView {
                ZStack {
                    if (tasks.tasksList.isEmpty && UserDefaults.standard.bool(forKey: "SHOW_COMPLETED_TASKS") && tasks.completedTasks.isEmpty)
                        || (tasks.tasksList.isEmpty && !UserDefaults.standard.bool(forKey: "SHOW_COMPLETED_TASKS")){
                        NoTasksView(subText: "Tasks created will appear here.")
                            .offset(y: -30)
                    }

                    ScrollView {
                        VStack(spacing: 15) {
                            ForEach(Array(tasks.tasksList.enumerated()), id: \.element.id) { index, task in
                                if index == 0 || task.compareTo(other: tasks.tasksList[index - 1]) > 0 {
                                    DateSeparator(date: task.date)
                                }

                                TaskCellView(task: task)
                                    .padding(.horizontal)
                                    .onTapGesture {
                                        isShowingDetailView = true
                                        selectedTask = task
                                    }
                            }
                            
                            if UserDefaults.standard.bool(forKey: "SHOW_COMPLETED_TASKS") {
                                if !tasks.completedTasks.isEmpty {
                                    HStack {
                                        Text("Completed")
                                            .font(.headline)
                                            .shadow(radius: 5, x: 0, y: 3)
                                    }
                                }
                                
                                ForEach(tasks.completedTasks.reversed()) { task in
                                    CompletedTaskCellView(task: task)
                                        .padding(.horizontal)
                                }
                            }
                        }
                        .padding(.top)
                    }
                    .disabled(isShowingDetailView)
                    
                    AddButtonView(varToSetTrue: $isCreatingTask)
                        .disabled(isShowingDetailView)
                }
                .navigationTitle("Tasks")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        StatsButton(isShowingStatsView: $isShowingStatsView)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        SettingsButton(isShowingSettingsView: $isShowingSettingsView)
                    }
                }
            }
            .blur(radius: isShowingDetailView ? 20 : 0)
            .sheet(isPresented: $isShowingStatsView) {
                StatsView(isShowingStatsView: $isShowingStatsView)
            }
            .sheet(isPresented: $isShowingSettingsView) {
                SettingsView(isShowingSettingsView: $isShowingSettingsView)
            }
            .sheet(isPresented: $isCreatingTask) {
                CreateTaskView(isCreatingTask: $isCreatingTask)
            }
            
            if isShowingDetailView {
                TaskDetailView(task: selectedTask!, isShowingDetailView: $isShowingDetailView)
            }
        }
        .onDisappear() {
            isShowingDetailView = false;
        }
    }
}

//
//  TodaysTasksView.swift
//  ToDo
//
//  Created by Jaime Zepeda on 10/18/23.
//

import SwiftUI

struct TodaysTasksView: View {
    
    @EnvironmentObject var tasks: Tasks
    @State private var isShowingStatsView = false
    @State private var isShowingSettingsView = false
    let currentDate = Date()
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, Y"
        return dateFormatter.string(from: currentDate)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                if tasks.todaysTasksSet.isEmpty {
                    NoTasksView(subText: "Tasks added to Today's Tasks will appear here.")
                        .offset(y: -30)
                }
                
                VStack {
                    if UserDefaults.standard.bool(forKey: "POMODORO_TIMER") {
                        TimerView()
                    }
                    
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(tasks.todaysTaskList) { task in
                                TodaysTaskCellView(task: task)
                                    .padding(.horizontal)
                            }
                        }
                        .padding(.top)
                    }
                    
                    Spacer()
                }
                .padding(.top)
            }
            .navigationTitle("\(formattedDate)")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    StatsButton(isShowingStatsView: $isShowingStatsView)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    SettingsButton(isShowingSettingsView: $isShowingSettingsView)
                }
            }
        }
        .sheet(isPresented: $isShowingStatsView) {
            StatsView(isShowingStatsView: $isShowingStatsView)
        }
        .sheet(isPresented: $isShowingSettingsView) {
            SettingsView(isShowingSettingsView: $isShowingSettingsView)
        }
    }
}

#Preview {
    TodaysTasksView()
}

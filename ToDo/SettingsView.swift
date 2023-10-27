//
//  SettingsView.swift
//  ToDo
//
//  Created by Jaime Zepeda on 10/18/23.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var isShowingSettingsView: Bool
    @State private var showCompletedTasks = UserDefaults.standard.bool(forKey: "SHOW_COMPLETED_TASKS")
    @State private var notificationsEnabled = UserDefaults.standard.bool(forKey: "NOTIFICATIONS_ENABLED")
    @State private var notificationFrequency = "Daily"
    @State private var pomodoroTimerEnabled = UserDefaults.standard.bool(forKey: "POMODORO_TIMER")
    @State private var timerAlert = UserDefaults.standard.bool(forKey: "TIMER_ALERT")
    
    var notificationFrequencies = ["Daily", "Every 2 Days", "Every 3 Days", "Weekly"]
        
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    Section(header: Text("Task Settings")) {
                        Toggle("Show Completed Tasks", isOn: $showCompletedTasks)
                    }
                    
                    
                    Section(header: Text("Notification Settings")) {
                        Toggle("Enable Notifications", isOn: $notificationsEnabled)
                        
                        if notificationsEnabled {
                            Picker("Frequency", selection: $notificationFrequency) {
                                ForEach(notificationFrequencies, id: \.self) { frequency in
                                    Text(frequency)
                                }
                            }
                        }
                    }
                    
                    Section(header: Text("Pomodoro")) {
                        Toggle("Enable Timer", isOn: $pomodoroTimerEnabled)
                        
                        if pomodoroTimerEnabled {
                            Toggle("Timer Alert", isOn: $timerAlert)
                        }
                    }
                }
            }
            .navigationTitle("Settings")
            .multilineTextAlignment(.center)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowingSettingsView = false
                    } label: {
                        Text("Done")
                    }
                    .tint(.black)
                }
            }
        }
        .onDisappear() {
            saveSettings()
        }
    }
    
    func saveSettings() {
        UserDefaults.standard.set(showCompletedTasks, forKey: "SHOW_COMPLETED_TASKS")
        UserDefaults.standard.set(notificationsEnabled, forKey: "NOTIFICATIONS_ENABLED")
        UserDefaults.standard.set(pomodoroTimerEnabled, forKey: "POMODORO_TIMER")
        UserDefaults.standard.set(timerAlert, forKey: "TIMER_ALERT")
    }
}

#Preview {
    SettingsView(isShowingSettingsView: .constant(true))
}

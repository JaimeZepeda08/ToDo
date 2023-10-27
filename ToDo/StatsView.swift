//
//  StatsView.swift
//  ToDo
//
//  Created by Jaime Zepeda on 10/26/23.
//

import SwiftUI

struct StatsView: View {
    
    @Binding var isShowingStatsView: Bool
    @EnvironmentObject var tasks: Tasks
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Text("Tasks Completed")
                    
                    Spacer()
                    
                    Text("\(tasks.completedTasks.count)")
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("App Statistics")
            .multilineTextAlignment(.center)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowingStatsView = false
                    } label: {
                        Text("Done")
                    }
                    .tint(.black)
                }
            }
        }
    }
}

#Preview {
    StatsView(isShowingStatsView: .constant(true))
}

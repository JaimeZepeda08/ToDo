//
//  CompletedTaskCellView.swift
//  ToDo
//
//  Created by Jaime Zepeda on 10/20/23.
//

import SwiftUI

struct CompletedTaskCellView: View {
    
    var task: Task
    @EnvironmentObject var tasks: Tasks
    
    var body: some View {
        Rectangle()
            .foregroundColor(task.category.color)
            .frame(width: 280, height: 60)
            .overlay {
                VStack {
                    Spacer()
                    
                    HStack {
                        Text(task.category.name)
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.leading, 20)
                        
                        Spacer()
                    }
                         
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
            }
            .cornerRadius(10)
    }
}

#Preview {
    CompletedTaskCellView(task: MockData.sampleTask)
}

//
//  AccountButton.swift
//  ToDo
//
//  Created by Jaime Zepeda on 10/24/23.
//

import SwiftUI

struct StatsButton: View {
    
    @Binding var isShowingStatsView: Bool
    
    var body: some View {
        Button {
            isShowingStatsView.toggle()
        } label: {
            Image(systemName: "chart.bar.xaxis")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
        }
        .tint(.black)
    }
}

#Preview {
    StatsButton(isShowingStatsView: .constant(true))
}

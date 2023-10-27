//
//  SettingsButton.swift
//  ToDo
//
//  Created by Jaime Zepeda on 10/24/23.
//

import SwiftUI

struct SettingsButton: View {
    
    @Binding var isShowingSettingsView: Bool
    
    var body: some View {
        Button {
            isShowingSettingsView.toggle()
        } label: {
            Image(systemName: "gearshape.fill")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 30, height: 30)
        }
        .tint(.black)
    }
}

#Preview {
    SettingsButton(isShowingSettingsView: .constant(true))
}

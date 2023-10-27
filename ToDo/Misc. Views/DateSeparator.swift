//
//  DateSeparator.swift
//  ToDo
//
//  Created by Jaime Zepeda on 10/19/23.
//

import SwiftUI

struct DateSeparator: View {
    
    var date: Date
    
    var body: some View {
        var formattedDate: String {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MMMM d"
                return dateFormatter.string(from: date)
        }
        
        HStack {
            if Calendar(identifier: .gregorian).compare(date, to: Date(), toGranularity: .day) == .orderedAscending {
                Rectangle()
                    .frame(width:80, height: 2)
                    .foregroundColor(.red)
                
                Text("\(formattedDate)")
                    .font(.headline)
                    .foregroundColor(.red)
                
                Rectangle()
                    .frame(width: .infinity, height: 2)
                    .foregroundColor(.red)
                
            } else {
                Rectangle()
                    .frame(width:80, height: 2)
                    .foregroundColor(.appBlack)
                
                Text("\(formattedDate)")
                    .font(.headline)
                
                Rectangle()
                    .frame(width: .infinity, height: 2)
                    .foregroundColor(.appBlack)
            }
        }
        .shadow(radius: 5, x: 0, y: 3)
    }
}

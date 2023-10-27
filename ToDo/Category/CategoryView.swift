//
//  CategoryView.swift
//  ToDo
//
//  Created by Jaime Zepeda on 10/18/23.
//

import SwiftUI

struct CategoryView: View {
    
    @EnvironmentObject var categories: Categories
    @State private var isShowingStatsView = false
    @State private var isShowingSettingsView = false
    @State var isCreatingCategory: Bool = false
    
    var body: some View {
        NavigationView() {
            ZStack {
                ScrollView {
                    let columns: [GridItem] = [GridItem(), GridItem()]
                    LazyVGrid (columns: columns, spacing: 30){
                        ForEach(categories.getCategories()) { category in
                            NavigationLink(destination: CategoryTaskListView(category: category)) {
                                CategoryFolderView(category: category)
                            }
                            .overlay {
                                if category != DefaultCategory.OTHER {
                                    HStack {
                                        Spacer()
                                        
                                        VStack {
                                            Button {
                                                
                                            } label: {
                                                Circle()
                                                    .foregroundColor(.red)
                                                    .overlay {
                                                        Image(systemName: "trash")
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width: 20, height: 20)
                                                            .foregroundColor(.white)
                                                    }
                                                    .frame(width: 30, height: 30)
                                                    .shadow(radius: 5, x: 0, y: 3)
                                            }
                                            .offset(y: -5)
                                            
                                            Spacer()
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }
                
                AddButtonView(varToSetTrue: $isCreatingCategory)
            }
            .navigationTitle("Categories")
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
        .sheet(isPresented: $isCreatingCategory) {
            CreateCategoryView(isCreatingCategory: $isCreatingCategory)
        }
    }
}

//
//  MenuItemsView.swift
//  Little Lemon dinner menu
//
//  Created by Geovani Mendoza on 21/5/26.
//

import SwiftUI

struct MenuItemsView: View {
    @StateObject private var viewModel = MenuViewViewModel()
    @State private var isShowingFilterSheet = false
    
    // 3-column flexible grid layout
    private let columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    
                    // Food Section
                    if viewModel.selectedCategories.contains(.food) && !viewModel.foodMenuItems.isEmpty {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Food")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            
                            LazyVGrid(columns: columns, spacing: 15) {
                                ForEach(viewModel.foodMenuItems) { item in
                                    NavigationLink(value: item) {
                                        menuItemCell(item)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Drinks Section
                    if viewModel.selectedCategories.contains(.drink) && !viewModel.drinkMenuItems.isEmpty {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Drinks")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            
                            LazyVGrid(columns: columns, spacing: 15) {
                                ForEach(viewModel.drinkMenuItems) { item in
                                    NavigationLink(value: item) {
                                        menuItemCell(item)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Dessert Section
                    if viewModel.selectedCategories.contains(.dessert) && !viewModel.dessertMenuItems.isEmpty {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Dessert")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            
                            LazyVGrid(columns: columns, spacing: 15) {
                                ForEach(viewModel.dessertMenuItems) { item in
                                    NavigationLink(value: item) {
                                        menuItemCell(item)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Menu")
            .navigationDestination(for: MenuItem.self) { item in
                MenuItemDetailsView(menuItem: item)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isShowingFilterSheet = true
                    }) {
                        Image(systemName: "slider.horizontal.3")
                            .imageScale(.large)
                    }
                }
            }
            .sheet(isPresented: $isShowingFilterSheet) {
                MenuItemsOptionView(viewModel: viewModel)
            }
        }
    }
    
    // Individual Menu Item cell
    private func menuItemCell(_ item: MenuItem) -> some View {
        VStack(spacing: 8) {
            Color.black
                .aspectRatio(4/3, contentMode: .fit)
                .cornerRadius(4)
            
            Text(item.title)
                .font(.footnote)
                .foregroundColor(.primary)
                .lineLimit(1)
        }
    }
}

#Preview {
    MenuItemsView()
}

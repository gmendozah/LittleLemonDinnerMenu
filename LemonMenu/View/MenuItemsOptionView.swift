//
//  MenuItemsOptionView.swift
//  Little Lemon dinner menu
//
//  Created by Geovani Mendoza on 21/5/26.
//

import SwiftUI

struct MenuItemsOptionView: View {
    @ObservedObject var viewModel: MenuViewViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("SELECTED CATEGORIES")) {
                    ForEach(MenuCategory.allCases) { category in
                        Button(action: {
                            if viewModel.selectedCategories.contains(category) {
                                viewModel.selectedCategories.remove(category)
                            } else {
                                viewModel.selectedCategories.insert(category)
                            }
                            viewModel.updateFilteredItems()
                        }) {
                            HStack {
                                Text(category.rawValue)
                                    .foregroundColor(.primary)
                                Spacer()
                                if viewModel.selectedCategories.contains(category) {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                    }
                }
                
                Section(header: Text("SORT BY")) {
                    ForEach(MenuViewViewModel.SortOption.allCases) { option in
                        Button(action: {
                            viewModel.sortBy = option
                            viewModel.updateFilteredItems()
                        }) {
                            HStack {
                                Text(option.rawValue)
                                    .foregroundColor(.primary)
                                Spacer()
                                if viewModel.sortBy == option {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Filter")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .fontWeight(.bold)
                }
            }
        }
    }
}

#Preview {
    MenuItemsOptionView(viewModel: MenuViewViewModel())
}

//
//  MenuViewViewModel.swift
//  Little Lemon dinner menu
//
//  Created by Geovani Mendoza on 21/5/26.
//

import Foundation
import Combine

class MenuViewViewModel: ObservableObject {
    @Published var foodMenuItems: [MenuItem] = []
    @Published var drinkMenuItems: [MenuItem] = []
    @Published var dessertMenuItems: [MenuItem] = []
    
    // Backup of all items for sorting and filtering
    private var allFoodItems: [MenuItem] = []
    private var allDrinkItems: [MenuItem] = []
    private var allDessertItems: [MenuItem] = []
    
    // Sort and Filter Options
    @Published var selectedCategories: Set<MenuCategory> = Set(MenuCategory.allCases)
    @Published var sortBy: SortOption = .mostPopular
    
    enum SortOption: String, CaseIterable, Identifiable {
        case mostPopular = "Most Popular"
        case price = "Price $-$$$"
        case alphabetical = "A-Z"
        
        var id: String { self.rawValue }
    }
    
    init() {
        setupMockData()
        updateFilteredItems()
    }
    
    func updateFilteredItems() {
        if selectedCategories.contains(.food) {
            foodMenuItems = sortItems(allFoodItems)
        } else {
            foodMenuItems = []
        }
        
        if selectedCategories.contains(.drink) {
            drinkMenuItems = sortItems(allDrinkItems)
        } else {
            drinkMenuItems = []
        }
        
        if selectedCategories.contains(.dessert) {
            dessertMenuItems = sortItems(allDessertItems)
        } else {
            dessertMenuItems = []
        }
    }
    
    private func sortItems(_ items: [MenuItem]) -> [MenuItem] {
        switch sortBy {
        case .mostPopular:
            return items.sorted(by: { $0.ordersCount > $1.ordersCount })
        case .price:
            return items.sorted(by: { $0.price < $1.price })
        case .alphabetical:
            return items.sorted(by: { $0.title.localizedStandardCompare($1.title) == .orderedAscending })
        }
    }
    
    private func setupMockData() {
        allFoodItems = [
            MenuItem(title: "Food 1", ingredients: [.spinach, .broccoli, .carrot], price: 10.99, menuCategory: .food, ordersCount: 100),
            MenuItem(title: "Food 2", ingredients: [.pasta, .tomatoSauce], price: 8.99, menuCategory: .food, ordersCount: 250),
            MenuItem(title: "Food 3", ingredients: [.spinach, .pasta, .tomatoSauce], price: 12.49, menuCategory: .food, ordersCount: 50),
            MenuItem(title: "Food 4", ingredients: [.broccoli, .carrot], price: 7.99, menuCategory: .food, ordersCount: 400),
            MenuItem(title: "Food 5", ingredients: [.spinach, .broccoli, .carrot, .pasta], price: 14.99, menuCategory: .food, ordersCount: 1000),
            MenuItem(title: "Food 6", ingredients: [.tomatoSauce], price: 6.99, menuCategory: .food, ordersCount: 80),
            MenuItem(title: "Food 7", ingredients: [.spinach, .pasta], price: 11.99, menuCategory: .food, ordersCount: 150),
            MenuItem(title: "Food 8", ingredients: [.broccoli, .pasta, .tomatoSauce], price: 13.99, menuCategory: .food, ordersCount: 300),
            MenuItem(title: "Food 9", ingredients: [.carrot, .tomatoSauce], price: 9.49, menuCategory: .food, ordersCount: 120),
            MenuItem(title: "Food 10", ingredients: [.spinach, .carrot, .pasta], price: 10.49, menuCategory: .food, ordersCount: 90),
            MenuItem(title: "Food 11", ingredients: [.broccoli, .tomatoSauce], price: 9.99, menuCategory: .food, ordersCount: 220),
            MenuItem(title: "Food 12", ingredients: [.spinach, .broccoli, .carrot, .pasta, .tomatoSauce], price: 16.99, menuCategory: .food, ordersCount: 600)
        ]
        
        allDrinkItems = [
            MenuItem(title: "Drink 1", ingredients: [], price: 2.99, menuCategory: .drink, ordersCount: 500),
            MenuItem(title: "Drink 2", ingredients: [], price: 3.49, menuCategory: .drink, ordersCount: 350),
            MenuItem(title: "Drink 3", ingredients: [], price: 1.99, menuCategory: .drink, ordersCount: 800),
            MenuItem(title: "Drink 4", ingredients: [], price: 4.49, menuCategory: .drink, ordersCount: 200),
            MenuItem(title: "Drink 5", ingredients: [], price: 2.49, menuCategory: .drink, ordersCount: 450),
            MenuItem(title: "Drink 6", ingredients: [], price: 3.99, menuCategory: .drink, ordersCount: 150),
            MenuItem(title: "Drink 7", ingredients: [], price: 1.49, menuCategory: .drink, ordersCount: 950),
            MenuItem(title: "Drink 8", ingredients: [], price: 4.99, menuCategory: .drink, ordersCount: 100)
        ]
        
        allDessertItems = [
            MenuItem(title: "Dessert 1", ingredients: [], price: 5.99, menuCategory: .dessert, ordersCount: 300),
            MenuItem(title: "Dessert 2", ingredients: [], price: 6.49, menuCategory: .dessert, ordersCount: 180),
            MenuItem(title: "Dessert 3", ingredients: [], price: 4.99, menuCategory: .dessert, ordersCount: 550),
            MenuItem(title: "Dessert 4", ingredients: [], price: 7.99, menuCategory: .dessert, ordersCount: 90)
        ]
    }
}

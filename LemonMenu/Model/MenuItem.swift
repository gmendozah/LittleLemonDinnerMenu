//
//  MenuItem.swift
//  Little Lemon dinner menu
//
//  Created by Geovani Mendoza on 21/5/26.
//

import Foundation

struct MenuItem: Identifiable, MenuItemProtocol, Codable, Hashable {
    let id: UUID
    var title: String
    var ingredients: [Ingredient]
    var price: Double
    var menuCategory: MenuCategory
    var ordersCount: Int
    
    // Conformance to MenuItemProtocol
    var priceInt: Int {
        get {
            return Int(price)
        }
        set {
            price = Double(newValue)
        }
    }
    
    var ingredient: [Ingredient] {
        get {
            return ingredients
        }
        set {
            ingredients = newValue
        }
    }
    
    init(id: UUID = UUID(), title: String, ingredients: [Ingredient], price: Double, menuCategory: MenuCategory, ordersCount: Int) {
        self.id = id
        self.title = title
        self.ingredients = ingredients
        self.price = price
        self.menuCategory = menuCategory
        self.ordersCount = ordersCount
    }
}

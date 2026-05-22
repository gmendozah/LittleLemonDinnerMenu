//
//  MenuCategory.swift
//  Little Lemon dinner menu
//
//  Created by Geovani Mendoza on 21/5/26.
//

import Foundation

enum MenuCategory: String, CaseIterable, Codable, Identifiable {
    case food = "Food"
    case drink = "Drink"
    case dessert = "Dessert"
    
    var id: String { rawValue }
}

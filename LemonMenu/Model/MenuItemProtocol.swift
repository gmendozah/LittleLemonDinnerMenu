//
//  MenuItemProtocol.swift
//  Little Lemon dinner menu
//
//  Created by Geovani Mendoza on 21/5/26.
//

import Foundation

protocol MenuItemProtocol {
    var id: UUID { get }
    var price: Double { get }
    var title: String { get }
    var menuCategory: MenuCategory { get }
    var ordersCount: Int { get set }
    var priceInt: Int { get set }
    var ingredient: [Ingredient] { get set }
}

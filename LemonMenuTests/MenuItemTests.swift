//
//  MenuItemTests.swift
//  LemonMenuTests
//
//  Created by Geovani Mendoza on 21/5/26.
//

import XCTest
@testable import LemonMenu

final class MenuItemTests: XCTestCase {
    
    func test_menuItem_titleIsShown() {
        // Arrange
        let expectedTitle = "Margherita Pizza"
        
        // Act
        let menuItem = MenuItem(
            title: expectedTitle,
            ingredients: [.tomatoSauce, .spinach],
            price: 11.99,
            menuCategory: .food,
            ordersCount: 100
        )
        
        // Assert
        XCTAssertEqual(menuItem.title, expectedTitle, "The menu item title should equal the initialized value.")
    }
    
    func test_menuItem_ingredientsAreDisplayed() {
        // Arrange
        let expectedIngredients: [Ingredient] = [.pasta, .tomatoSauce, .broccoli]
        
        // Act
        let menuItem = MenuItem(
            title: "Pasta Primavera",
            ingredients: expectedIngredients,
            price: 13.99,
            menuCategory: .food,
            ordersCount: 50
        )
        
        // Assert
        XCTAssertEqual(menuItem.ingredients, expectedIngredients, "The menu item ingredients should equal the initialized values.")
    }
}

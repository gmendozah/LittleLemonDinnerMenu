//
//  MenuItemDetailsView.swift
//  Little Lemon dinner menu
//
//  Created by Geovani Mendoza on 21/5/26.
//

import SwiftUI

struct MenuItemDetailsView: View {
    let menuItem: MenuItem
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                HStack {
                    Text(menuItem.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.horizontal)
                Image("littleLemonLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 250)
                    .padding(.vertical, 10)
                VStack(spacing: 4) {
                    Text("Price:")
                        .font(.headline)
                        .fontWeight(.semibold)
                    Text(String(format: "%.2f", menuItem.price))
                        .font(.body)
                }
                VStack(spacing: 4) {
                    Text("Ordered:")
                        .font(.headline)
                        .fontWeight(.semibold)
                    Text(numberFormatter.string(from: NSNumber(value: menuItem.ordersCount)) ?? "\(menuItem.ordersCount)")
                        .font(.body)
                }
                if !menuItem.ingredients.isEmpty {
                    VStack(spacing: 4) {
                        Text("Ingredients:")
                            .font(.headline)
                            .fontWeight(.semibold)
                        ForEach(menuItem.ingredients, id: \.self) { ingredient in
                            Text(ingredient.rawValue.lowercased())
                                .font(.body)
                        }
                    }
                }
                
                Spacer()
            }
            .padding(.bottom)
        }
        .navigationTitle(menuItem.title)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }
}

#Preview {
    MenuItemDetailsView(menuItem: MenuItem(title: "Food 5", ingredients: [.spinach, .broccoli, .carrot, .pasta], price: 10.99, menuCategory: .food, ordersCount: 1000))
}

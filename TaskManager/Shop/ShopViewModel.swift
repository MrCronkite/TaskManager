//
//  ShopViewModel.swift
//  TaskManager
//
//  Created by Влад Шимченко on 10.06.2026.
//

import SwiftUI
import Combine
import Observation

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    let isImportant: Bool
    var quantity: Int


    static var products: [Product] = [
        .init(name: "Moloko", price: 123.0, isImportant: true, quantity: 0),
        .init(name: "Beer", price: 80.2, isImportant: false, quantity: 0),
        .init(name: "Bread", price: 45.5, isImportant: false, quantity: 0),
        .init(name: "Cheese", price: 210.0, isImportant: true, quantity: 0),
        .init(name: "Apple", price: 70.0, isImportant: false, quantity: 0),
        .init(name: "Banana", price: 55.9, isImportant: false, quantity: 0),
        .init(name: "Coffee", price: 350.0, isImportant: true, quantity: 0),
        .init(name: "Tea", price: 120.0, isImportant: false, quantity: 0),
        .init(name: "Chocolate", price: 95.0, isImportant: true, quantity: 0),
        .init(name: "Butter", price: 180.0, isImportant: false, quantity: 0),
        .init(name: "Eggs", price: 150.0, isImportant: false, quantity: 0),
        .init(name: "Chicken", price: 420.0, isImportant: true, quantity: 0),
        .init(name: "Rice", price: 130.0, isImportant: false, quantity: 0),
        .init(name: "Pasta", price: 90.0, isImportant: false, quantity: 0),
        .init(name: "Juice", price: 110.0, isImportant: false, quantity: 0),
        .init(name: "Water", price: 40.0, isImportant: false, quantity: 0),
        .init(name: "Salmon", price: 850.0, isImportant: true, quantity: 0),
        .init(name: "Potato", price: 60.0, isImportant: false, quantity: 0),
        .init(name: "Tomato", price: 140.0, isImportant: false, quantity: 0),
        .init(name: "Ice Cream", price: 200.0, isImportant: true, quantity: 0)
    ]
}


@Observable
final class ShopViewModel {

    var products: [Product] = []

    var cartCount: Int = 0
    var isLoading = false

    func addToCart(_ product: Product) {

        cartCount += product.quantity > 0
        ? product.quantity
        : 1
    }

    func loadProducts() async {
        isLoading = true

        try? await Task.sleep(nanoseconds: 3_000_000_000)

        products = Product.products

        isLoading = false
    }

    func filteredProduct(searchQuery: String) async -> [Product] {
        guard !searchQuery.isEmpty else {
            return products
        }

        return products.filter {
            $0.name.localizedCaseInsensitiveContains(searchQuery)
        }
    }
}

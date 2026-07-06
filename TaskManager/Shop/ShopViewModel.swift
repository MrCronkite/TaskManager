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
}


@Observable
final class ShopViewModel {

    var products: [Product] = [
        .init(name: "Moloko", price: 123.0, isImportant: true, quantity: 0),
        .init(name: "Beer", price: 80.2, isImportant: false, quantity: 0)
    ]

    var cartCount: Int = 0

    func addToCart(_ product: Product) {
        
        cartCount += product.quantity > 0
        ? product.quantity
        : 1
    }
}

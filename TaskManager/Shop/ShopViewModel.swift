//
//  ShopViewModel.swift
//  TaskManager
//
//  Created by Влад Шимченко on 10.06.2026.
//

import SwiftUI
import Combine

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    let isImportant: Bool
}


final class ShopViewModel: ObservableObject {

    @Published var products: [Product] = [
        .init(name: "Moloko", price: 123.0, isImportant: true),
        .init(name: "Beer", price: 80.2, isImportant: false)
    ]

    @Published var cartCount: Int = 0

    func addToCart(_ product: Product) {
        cartCount += 1
    }
}

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
}


final class ShopViewModel: ObservableObject {

    @Published var products: [Product] = [
        .init(name: "Moloko", price: 123.0),
        .init(name: "Beer", price: 80.2)
    ]

    @Published var cartCount: Int = 0

    func addToCart(_ product: Product) {
        cartCount += 1
    }
}

//
//  ProductRow.swift
//  TaskManager
//
//  Created by Влад Шимченко on 10.06.2026.
//

import SwiftUI
import Observation

struct ProductRow: View {

    @Binding var product: Product

    @Environment(ShopViewModel.self)
    private var vm

    @Environment(\.colorScheme)
    private var colorScheme

    var body: some View {

        VStack(alignment: .leading) {
            Text(product.name)

            Text(product.price, format: .currency(code: "USD"))

            Stepper(
                "Quantity \(product.quantity)",
                value: $product.quantity,
                in: 0...99
            )
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            colorScheme == .dark
            ? product.isImportant ? .red.opacity(0.3) : Color.gray.opacity(0.3)
            : product.isImportant ? .red.opacity(0.3) : Color.white
        )
        .clipShape(
            RoundedRectangle(cornerRadius: 12)
        )
        .overlay(alignment: .trailing) {

            Button("В корзину") {
                vm.addToCart(product)
            }
            .padding()
        }
    }
}

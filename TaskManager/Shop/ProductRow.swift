//
//  ProductRow.swift
//  TaskManager
//
//  Created by Влад Шимченко on 10.06.2026.
//

import SwiftUI

struct ProductRow: View {

    let product: Product

    @EnvironmentObject
    private var viewModel: ShopViewModel

    @Environment(\.colorScheme)
    private var colorScheme

    var body: some View {

        VStack(alignment: .leading) {
            Text(product.name)

            Text("$\(product.price)")
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
                viewModel.addToCart(product)
            }
            .padding()
        }
    }
}

//
//  ProductListView.swift
//  TaskManager
//
//  Created by Влад Шимченко on 10.06.2026.
//

import SwiftUI
import Observation

struct ProductListView: View {

    @Environment(ShopViewModel.self)
    private var vm

    var body: some View {
        @Bindable var vm = vm

        NavigationStack {
            List($vm.products) { $product in
                ProductRow(
                    product: $product
                )
            }
            .navigationTitle("Products")
            .toolbar {
                CartBadge()
            }
        }
    }
}

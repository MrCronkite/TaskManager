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

    @State private var searchQuery = ""
    @State private var filteredProducts: [Product] = []

    var body: some View {
        @Bindable var vm = vm

        NavigationStack {
            Group {
                if vm.isLoading {
                    ProgressView("Loading")
                } else {
                    List($filteredProducts) { $product in
                        ProductRow(product: $product)
                            .equatable()
                    }
                }
            }
            .navigationTitle("Products")
            .searchable(text: $searchQuery, prompt: "Search products")
            .toolbar {
                CartBadge()
            }
        }
        .task(id: searchQuery) {
            filteredProducts = await vm.filteredProduct(searchQuery: searchQuery)
        }
        .task {
            await vm.loadProducts()
            filteredProducts = vm.products
        }
        .onDisappear {
            print("left shop")
        }
    }
}

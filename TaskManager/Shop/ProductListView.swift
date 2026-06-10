//
//  ProductListView.swift
//  TaskManager
//
//  Created by Влад Шимченко on 10.06.2026.
//

import SwiftUI

struct ProductListView: View {

    @EnvironmentObject
    private var vm: ShopViewModel

    var body: some View {
        NavigationStack {
            List(vm.products) {
                ProductRow(product: $0)
            }
            .navigationTitle("Products")
            .toolbar {
              CartBadge()
            }
        }
    }
}

//
//  CartBadge.swift
//  TaskManager
//
//  Created by Влад Шимченко on 10.06.2026.
//

import SwiftUI
import Observation

struct CartBadge: View {

    @Environment(ShopViewModel.self)
    private var vm

    var body: some View {

        ZStack(alignment: .topTrailing) {
            Image(systemName: "cart.fill")
                .font(.caption2)
                .foregroundStyle(.primary)

            if vm.cartCount > 0 {
                Text("\(vm.cartCount)")
                    .font(.caption2).bold()
                    .foregroundStyle(.white)
                    .padding(4)
                    .background(.red)
                    .clipShape(Circle())
                    .offset(x: 8, y: -8)
            }
        }
    }
}

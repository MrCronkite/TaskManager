//
//  CartBadge.swift
//  TaskManager
//
//  Created by Влад Шимченко on 10.06.2026.
//

import SwiftUI

struct CartBadge: View {

    @EnvironmentObject
    private var viewModel: ShopViewModel

    var body: some View {

        ZStack(alignment: .topTrailing) {
            Image(systemName: "cart.fill")
                .font(.caption2)
                .foregroundStyle(.primary)

            if viewModel.cartCount > 0 {
                Text("\(viewModel.cartCount)")
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

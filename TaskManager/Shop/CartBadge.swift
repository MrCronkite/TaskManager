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

        ZStack {

            Circle()
                .frame(width: 30, height: 30)

            Text("\(viewModel.cartCount)")
                .foregroundStyle(.white)
        }
    }
}

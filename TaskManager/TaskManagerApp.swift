//
//  TaskManagerApp.swift
//  TaskManager
//
//  Created by Влад Шимченко on 02.06.2026.
//

import SwiftUI
import Combine

@main
struct TaskManagerApp: App {

    @State private var vm = ShopViewModel()

    var body: some Scene {
        WindowGroup {
            ProductListView()
                .environment(vm)
        }
    }
}



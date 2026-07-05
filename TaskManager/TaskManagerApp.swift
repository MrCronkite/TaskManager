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

    @StateObject
    private var vm = ShopViewModel()

    var body: some Scene {
        WindowGroup {
            ProductListView()
                .environmentObject(vm)
        }
    }
}



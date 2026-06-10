//
//  TaskManagerApp.swift
//  TaskManager
//
//  Created by Влад Шимченко on 02.06.2026.
//

import SwiftUI

@main
struct TaskManagerApp: App {
    let vm = ShopViewModel()
    var body: some Scene {
        WindowGroup {
           ProductListView()
                .environmentObject(vm)
        }
    }
}

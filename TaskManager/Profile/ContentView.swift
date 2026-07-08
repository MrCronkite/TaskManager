//
//  ContentView.swift
//  TaskManager
//
//  Created by Влад Шимченко on 02.06.2026.
//

import SwiftUI

enum Priority: Comparable {
    case low
    case medium
    case high
}

extension Priority {

    var title: String {
        switch self {
        case .low:
            return "Low"

        case .medium:
            return "Medium"

        case .high:
            return "High"
        }
    }
}

enum TaskError: Error {
    case alreadyExists
    case notFound
}

struct TaskInter: Identifiable, Hashable, Comparable {

    let id: UUID

    @NonEmpty
    var name: String

    let priority: Priority
    let isDone: Bool

    static func < (lhs: TaskInter, rhs: TaskInter) -> Bool {
        lhs.priority < rhs.priority
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

}

@propertyWrapper
struct NonEmpty: Hashable {
    private var value: String

    var wrappedValue: String {
        get { value }
        set {
            value = newValue.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            ? "Без названия"
            : newValue
        }
    }

    init(wrappedValue: String) {
        self.value = wrappedValue.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        ? "Без названия"
        : wrappedValue
    }
}

struct TaskManager {

    var tasks: Set<TaskInter> = [
        .init(id: UUID(), name: "Погулять с собакой", priority: .high, isDone: false),
        .init(id: UUID(), name: "Купить молоко", priority: .high, isDone: true),
        .init(id: UUID(), name: "", priority: .medium, isDone: true),
        .init(id: UUID(), name: "Купить пиво", priority: .low, isDone: false)
    ]

    typealias TaskResult = Result<Void, TaskError>

    mutating func add(_ task: TaskInter) -> TaskResult {
        guard !tasks.contains(task) else {
            return .failure(.alreadyExists)
        }

        tasks.insert(task)
        return .success(())
    }

    mutating func remove(id: UUID) -> TaskResult {
        guard let task = tasks.first(where: { $0.id == id }) else {
            return .failure(.notFound)
        }

        tasks.remove(task)

        return .success(())
    }

    func tasks(sortedBy keyPath: KeyPath<TaskInter, some Comparable>) -> [TaskInter] {
        tasks.sorted {
            $0[keyPath: keyPath] < $1[keyPath: keyPath]
        }
    }
}

struct ContentView: View {

    @State private var manager = TaskManager()
    var body: some View {
        Text("Tasks")

        List {
            ForEach(manager.tasks(sortedBy: \.priority)) { task in
                TaskRow(task: task)
            }
            .onDelete(perform: delete)
        }

        Button("Add Task") {
            let task = TaskInter(
                id: UUID(),
                name: "Новая задача",
                priority: .medium,
                isDone: false
            )

            _ = manager.add(task)
        }
        .frame(height: 50)
        .font(.system(size: 20))
    }

    private func delete(with indexSet: IndexSet) {
        let sorted = manager.tasks(sortedBy: \.priority)
            indexSet.forEach { index in
                _ = manager.remove(id: sorted[index].id)
            }
    }
}

struct TaskRow: View {

    let task: TaskInter

    var body: some View {
        HStack {

            VStack(alignment: .leading) {
                Text(task.name)
                    .font(.headline)

                Text(task.priority.title)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Image(
                systemName: task.isDone
                ? "checkmark.circle.fill"
                : "circle"
            )
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    ContentView()
}

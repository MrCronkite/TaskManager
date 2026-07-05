//
//  CardView.swift
//  TaskManager
//
//  Created by Влад Шимченко on 02.06.2026.
//

import SwiftUI

enum Status {
    case online
    case busy
    case offline
}

struct CardView: View {
    var body: some View {


        Card(title: "Действия") {
            Button("Войти") {
                print("Login")
            }

            Button("Регистрация") {
                print("Register")
            }
        }

        HStack {
            StatusBadge(status: .online)

            StatusBadge(status: .busy)

            StatusBadge(status: .offline)
        }
    }
}

struct StatusBadge: View {

    let status: Status

    var body: some View {
        content
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(backgroundColor.opacity(0.15))
            .clipShape(Capsule())
    }

    @ViewBuilder
    private var content: some View {
        switch status {

        case .online:
            Label("Online", systemImage: "checkmark.circle.fill")
                .foregroundStyle(.green)

        case .busy:
            Label("Busy", systemImage: "minus.circle.fill")
                .foregroundStyle(.orange)

        case .offline:
            Label("Offline", systemImage: "xmark.circle.fill")
                .foregroundStyle(.gray)
        }
    }

    private var backgroundColor: Color {
        switch status {
        case .online: .green
        case .busy: .orange
        case .offline: .gray
        }
    }
}

struct Card<Content: View>: View {

    let title: String
    @ViewBuilder let content: () -> Content

    init(
        title: String,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.title = title
        self.content = content
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {

            Text(title)
                .font(.headline)

            content()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.background)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(
            color: .black.opacity(0.1),
            radius: 8,
            x: 0,
            y: 4
        )
        .padding(.horizontal)
    }
}


#Preview {
    CardView()
}

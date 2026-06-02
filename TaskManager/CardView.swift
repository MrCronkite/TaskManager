//
//  CardView.swift
//  TaskManager
//
//  Created by Влад Шимченко on 02.06.2026.
//

import SwiftUI

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

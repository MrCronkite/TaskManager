//
//  ProfileView.swift
//  TaskManager
//
//  Created by Влад Шимченко on 07.06.2026.
//

import SwiftUI

struct ProfileSettingsView: View {

    @State private var name = "Vlad Petrov"
    @State private var password = "12345678"
    @State private var isDarkMode = false

    @State private var fontSize: Double = 18
    @State private var notificationsCount = 5

    @State private var selectedLanguage = "RU"
    @State private var selectedMenuLanguage = "RU"

    private let languages = ["RU", "EN", "DE"]

    var body: some View {
        NavigationStack {
            ScrollView {

                VStack(spacing: 20) {

                    // MARK: Profile

                    VStack(spacing: 12) {

                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundStyle(.blue)

                        Text(name)
                            .font(.system(size: 20, weight: .bold))

                        Text("**iOS Developer** 4 года опыта")

                        Text("в поиске работы")
                            .strikethrough()

                        Link(
                            "🔗 GitHub Profile",
                            destination: URL(
                                string: "https://github.com/MrCronkite"
                            )!
                        )
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 16))

                    // MARK: Settings

                    VStack(alignment: .leading, spacing: 0) {

                        settingsRow {
                            Text("Имя")

                            TextField(
                                "Введите имя",
                                text: $name
                            )
                            .multilineTextAlignment(.trailing)
                        }

                        Divider()

                        settingsRow {
                            Text("Пароль")

                            SecureField(
                                "Введите пароль",
                                text: $password
                            )
                            .multilineTextAlignment(.trailing)
                        }

                        Divider()

                        settingsRow {
                            Text("Dark Mode")

                            Toggle("", isOn: $isDarkMode)
                        }

                        Divider()

                        VStack(alignment: .leading, spacing: 8) {

                            HStack {
                                Text("Шрифт")

                                Spacer()

                                Text("\(Int(fontSize))")
                            }

                            Slider(
                                value: $fontSize,
                                in: 12...30
                            )
                        }
                        .padding()

                        Divider()

                        Stepper(
                            "Уведомления: \(notificationsCount)",
                            value: $notificationsCount,
                            in: 0...99
                        )
                        .padding()

                        Divider()

                        VStack(alignment: .leading, spacing: 8) {

                            Text("Язык")

                            Picker(
                                "Язык",
                                selection: $selectedLanguage
                            ) {
                                ForEach(languages, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                        .padding()

                        Divider()

                        settingsRow {
                            Text("Язык")

                            Picker(
                                "Language",
                                selection: $selectedMenuLanguage
                            ) {
                                ForEach(languages, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(.menu)
                        }

                    }
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 16))

                    // MARK: Actions

                    VStack(spacing: 12) {

                        Button("Сохранить") {
                            print("Save")
                        }
                        .buttonStyle(.borderedProminent)
                        .controlSize(.large)
                        .frame(maxWidth: .infinity)

                        Button {

                        } label: {
                            Label(
                                "Поделиться",
                                systemImage: "square.and.arrow.up"
                            )
                            .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.bordered)

                        Button(
                            role: .destructive
                        ) {
                            print("Delete")
                        } label: {
                            Text("Удалить аккаунт")
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .padding()
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .padding()
            }
            .navigationTitle("Profile & Settings")
            .preferredColorScheme(
                isDarkMode ? .dark : .light
            )
        }
    }

    @ViewBuilder
    private func settingsRow<Content: View>(
        @ViewBuilder content: () -> Content
    ) -> some View {
        HStack {
            content()
        }
        .padding()
    }
}

#Preview {
    ProfileSettingsView()
}


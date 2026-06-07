//
//  ProfileView.swift
//  TaskManager
//
//  Created by Влад Шимченко on 07.06.2026.
//

import SwiftUI

struct ProfileView: View {

    @State var profileName: String = "Vlad Shimchenko"
    @State var password: String = ""
    @State var isDark: Bool = false

    var body: some View {
        ZStack {

            VStack {
                VStack {
                    Image(systemName: "figure.walk")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .background(Color.blue.opacity(0.5))
                        .cornerRadius(50)

                    Text(profileName)
                        .font(.title)
                        .fontWeight(.bold)

                    Text("iOS Developer 4 года опыта")
                        .font(.title2)
                        .fontWeight(.medium)

                    Text("~~ в поиске работы ~~")

                    Divider()

                    Link(destination: URL(string: "https://github.com/MrCronkite")!) {
                        Text("🔗 GitHub Profile")
                            .font(.system(size: 16))
                            .fontWeight(.medium)
                            .foregroundColor(.blue)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding()
                .background { Color.pink.opacity(0.3) }
                .clipShape(RoundedRectangle(cornerRadius: 20))

                VStack {
                    HStack {
                        Text("Имя:")
                            .font(.title3)

                        TextField("Введите текст", text: $profileName)
                            .frame(maxWidth: .infinity)
                    }
                    .padding()

                    Divider()

                    HStack {
                        Text("Пароль")
                            .font(.title3)

                        SecureField("Введите пароль", text: $password)
                    }
                    .padding()

                    Divider()

                    HStack {
                        Text("Dark mode")
                            .font(.title3)

                        Toggle(isOn: $isDark) {

                        }
                    }
                    .padding()

                }
                .frame(maxWidth: .infinity)
                .padding()
                .background { Color.pink.opacity(0.3) }
                .clipShape(RoundedRectangle(cornerRadius: 20))

            }
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}

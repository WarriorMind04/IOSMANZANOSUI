//
//  home.swift
//  VigilantFinal
//
//  Created by Jose Miguel Guerrero Jiménez on 07/06/25.
//

import SwiftUI

struct MainMenuView: View {
    @State private var selectedTab: TabItem = .home

    var body: some View {
        NavigationStack { // ✅ Navegación
            ZStack {
                Color.white.ignoresSafeArea()
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .cornerRadius(25)

                VStack(spacing: 40) {
                    NavBar(selectedTab: $selectedTab)

                    VStack(spacing: 30) {
                        HStack(spacing: 30) {
                            MenuItemView(label: "Assembly", imageName: "logo2")
                            MenuItemView(label: "FEM", imageName: "logo")
                            MenuItemView(label: "Settings", imageName: "engrane")
                        }
                        HStack(spacing: 30) {
                            NavigationLink(destination: UserInfoView()) {
                                MenuItemView(label: "User", imageName: "user")
                            }
                            MenuItemView(label: "Tutorials", imageName: "tutorialicon")
                        }
                    }

                    Spacer()
                }
                .padding(.top, 50)
            }
        }
    }
}

struct MenuItemView: View {
    var label: String
    var imageName: String
    var action: (() -> Void)? = nil

    var body: some View {
        Button(action: {
            action?()
        }) {
            VStack(spacing: 4) {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 580, height: 180)

                Text(label)
                    .font(.footnote)
                    .foregroundColor(.black)
            }
            .frame(width: 220, height: 220)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: .gray.opacity(0.2), radius: 8, x: 0, y: 5)
        }
        .buttonStyle(PlainButtonStyle()) // elimina el efecto de botón azul
    }
}

#Preview {
    MainMenuView()
}

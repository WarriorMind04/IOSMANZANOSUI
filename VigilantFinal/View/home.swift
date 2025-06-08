//
//  home.swift
//  VigilantFinal
//
//  Created by Jose Miguel Guerrero Jiménez on 07/06/25.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
        ZStack {
            // Fondo blanco con imagen decorativa
            Color.white.ignoresSafeArea()
            Image("ae70a177-0d19-430a-b509-0f13db2ddf2f")
                .resizable()
                .scaledToFit()
                .opacity(0.5)
                .offset(x: 100, y: 100)

            VStack(spacing: 30) {
                // Barra superior
                HStack(spacing: 20) {
                    Image(systemName: "rectangle.on.rectangle")
                        .padding(.leading, 20)

                    Spacer()

                    Text("HOME")
                        .font(.headline)
                        .foregroundColor(.cyan)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 6)
                        .background(Capsule().fill(Color.white))
                        .overlay(
                            Capsule().stroke(Color.cyan, lineWidth: 2)
                        )

                    Text("Import")
                    Text("Present")
                    Text("Tutorials")

                    Spacer()

                    Image(systemName: "magnifyingglass")
                        .padding(.trailing, 20)
                }
                .padding(.top, 20)

                // Contenedor de íconos
                VStack(spacing: 20) {
                    HStack(spacing: 20) {
                        MenuItemView(iconName: "link", label: "Assembly", customImage: "assembly")
                        MenuItemView(iconName: "link.badge.plus", label: "FEM", customImage: "fem")
                        MenuItemView(iconName: "gearshape", label: "Settings", customImage: "settings")
                    }

                    HStack(spacing: 20) {
                        MenuItemView(iconName: "person.crop.circle", label: "User", customImage: "user")
                        MenuItemView(iconName: "book.fill", label: "Tutorials", customImage: "tutorials")
                    }
                }
                Spacer()
            }
        }
    }
}

struct MenuItemView: View {
    var iconName: String
    var label: String
    var customImage: String

    var body: some View {
        VStack(spacing: 10) {
            Image(customImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)

            Text(label)
                .font(.subheadline)
                .foregroundColor(.black)
        }
        .frame(width: 120, height: 120)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .shadow(radius: 5)
        )
    }
}



#Preview {
    MainMenuView()
}

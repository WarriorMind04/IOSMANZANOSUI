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
            // Fondo decorativo
            Color.white.ignoresSafeArea()
            Image("background") // asegúrate de que sea similar al swirl de colores
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                

            VStack(spacing: 40) {
                // Barra superior
                NavBar()

                // Menú principal
                VStack(spacing: 30) {
                    HStack(spacing: 30) {
                        MenuItemView(label: "Assembly", imageName: "logo2")
                        MenuItemView(label: "FEM", imageName: "logo")
                        MenuItemView(label: "Settings", imageName: "engrane")
                    }
                    HStack(spacing: 30) {
                        MenuItemView(label: "User", imageName: "user")
                        MenuItemView(label: "Tutorials", imageName: "tutorialicon")
                    }
                }

                Spacer()
            }
            .padding(.top, 50)
        }
    }
}





struct MenuItemView: View {
    var label: String
    var imageName: String

    var body: some View {
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
}

#Preview {
    MainMenuView()
}

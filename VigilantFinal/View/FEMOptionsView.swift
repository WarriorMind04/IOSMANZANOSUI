//
//  FEMOptionsView.swift
//  VigilantFinal
//
//  Created by Jose Miguel Guerrero Jiménez on 07/06/25.
//

import SwiftUI

struct FEMOptionsView: View {
    @State private var selectedTab: TabItem = .home

    var body: some View {
        ZStack {
            // Fondo neutro para pruebas
            Color(.systemBackground)
                .ignoresSafeArea()
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .cornerRadius(25)

            VStack(spacing: 40) {
                NavBar(selectedTab: $selectedTab)
                    .padding(.top, 30)

                Spacer()

                HStack(spacing: 32) {
                    femOptionCard(imageName: "uploadicon", label: "Import FEM")
                    femOptionCard(imageName: "plus", label: "Create FEM", isSystemIcon: true)
                }
                .frame(maxWidth: 600)
                .padding(.horizontal)

                Spacer()
            }
        }
    }

    @ViewBuilder
    func femOptionCard(imageName: String, label: String, isSystemIcon: Bool = false) -> some View {
        VStack(spacing: 16) {
            if isSystemIcon {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .foregroundColor(.primary)
            } else {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
            }

            Text(label)
                .font(.headline)
                .foregroundColor(.black)
                
        }
        .frame(maxWidth: .infinity, minHeight: 180)
        .padding()
        .background(Color.white.opacity(0.9))
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}

#Preview {
    FEMOptionsView()
}

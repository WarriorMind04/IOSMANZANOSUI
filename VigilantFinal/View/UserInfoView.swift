//
//  UserInfoView.swift
//  VigilantFinal
//
//  Created by Jose Miguel Guerrero Jiménez on 07/06/25.
//

import SwiftUI

struct UserInfoView: View {
    @StateObject private var viewModel = UserInfoViewModel()
    @State private var selectedTab: TabItem = .home // ✅ Agregado

    var body: some View {
        ZStack {
            // Fondo
            Color.white.ignoresSafeArea()
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            // Contenido scrollable
            ScrollView {
                VStack(spacing: 20) {
                    NavBar(selectedTab: $selectedTab) // ✅ Corregido

                    UserInfoCardView(viewModel: viewModel)
                        .padding(.top, 10)
                }
                .padding()
            }
        }
    }
}

#Preview {
    UserInfoView()
}

//
//  ContentView.swift
//  VigilantFinal
//
//  Created by Jose Miguel Guerrero Jiménez on 07/06/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    @EnvironmentObject private var appModel: AppModel
    @State private var selectedTab: TabItem = .home

    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.ignoresSafeArea()
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack(spacing: 40) {
                    NavBar(selectedTab: $selectedTab)

                    VStack(spacing: 30) {
                        HStack(spacing: 30) {
                            // ✅ Assembly abre vista inmersiva
                            MenuItemView(label: "Assembly", imageName: "logo2") {
                                Task {
                                    await openImmersiveSpace(id: appModel.immersiveSpaceID)
                                }
                            }

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

                    // Opcional: botón para salir de inmersiva
                    Button("Salir de vista inmersiva") {
                        Task {
                            await dismissImmersiveSpace()
                        }
                    }
                    .padding(.bottom, 20)
                }
                .padding(.top, 50)
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    let appModel = AppModel()
    ContentView()
        .environmentObject(appModel)
}

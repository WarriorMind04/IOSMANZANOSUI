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

                    // ✅ Mostrar contenido según tab seleccionada
                    switch selectedTab {
                    case .home:
                        HomeMenuView()
                    case .importData:
                        ImportView()
                    case .present:
                        SettingsView()
                    case .tutorials:
                        TutoView()
                    }

                    Spacer()

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

    // Subvista para Home
    @ViewBuilder
    func HomeMenuView() -> some View {
        VStack(spacing: 30) {
            HStack(spacing: 30) {
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
    }

    // Subvista para FEM
    func ImportView() -> some View {
        FEMOptionsView()
    }

    // Subvista para Settings
    func SettingsView() -> some View {
        Text("Vista de configuración")
            .font(.largeTitle)
            .padding()
    }
    
    func TutoView() -> some View{
        TutorialsView()
    }
}

#Preview(windowStyle: .automatic) {
    let appModel = AppModel()
    ContentView()
        .environmentObject(appModel)
}

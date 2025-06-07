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

    var body: some View {
        VStack {
            Model3D(named: "Scene", bundle: realityKitContentBundle)
                .padding(.bottom, 50)

            Text("Hello, world!")

            Button("Entrar a vista inmersiva") {
                Task {
                    await openImmersiveSpace(id: appModel.immersiveSpaceID)
                }
            }

            Button("Salir de vista inmersiva") {
                Task {
                    await dismissImmersiveSpace()
                }
            }

            ToggleImmersiveSpaceButton()
                
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    let appModel = AppModel()
    ContentView()
        .environmentObject(appModel)
}

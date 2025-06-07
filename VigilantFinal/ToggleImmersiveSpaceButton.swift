//
//  ToggleImmersiveSpaceButton.swift
//  VigilantFinal
//
//  Created by Jose Miguel Guerrero Jiménez on 07/06/25.
//

import SwiftUI

struct ToggleImmersiveSpaceButton: View {

    @EnvironmentObject private var appModel: AppModel  // ✅ CORREGIDO

    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace

    var body: some View {
        Button {
            Task { @MainActor in
                switch appModel.immersiveSpaceState {
                case .open:
                    appModel.immersiveSpaceState = .inTransition
                    await dismissImmersiveSpace()
                    // No se marca como `.closed` aquí para evitar conflictos con `.onDisappear`.

                case .closed:
                    appModel.immersiveSpaceState = .inTransition
                    switch await openImmersiveSpace(id: appModel.immersiveSpaceID) {
                    case .opened:
                        // No se marca como `.open` aquí para evitar conflictos con `.onAppear`.
                        break
                    case .userCancelled, .error:
                        fallthrough
                    @unknown default:
                        appModel.immersiveSpaceState = .closed
                    }

                case .inTransition:
                    // No se debe poder presionar el botón en este estado.
                    break
                }
            }
        } label: {
            Text(appModel.immersiveSpaceState == .open ? "Ocultar Vista Inmersiva" : "Mostrar Vista Inmersiva")
        }
        .disabled(appModel.immersiveSpaceState == .inTransition)
        .fontWeight(.semibold)
    }
}

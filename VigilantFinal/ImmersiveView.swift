//
//  ImmersiveView.swift
//  VigilantFinal
//
//  Created by Jose Miguel Guerrero Jiménez on 07/06/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    var body: some View {
        RealityView { content in
            let component = ComponentModel(name: "Bloque", color: .blue)
            component.position = [0, 0, -0.5]
            content.add(component)
        } update: { content in
            // Actualizaciones en tiempo real aquí si quieres
        }
        .gesture(DragGesture().onChanged { value in
            // Maneja gestos aquí si quieres
        })
    }
}
#Preview(immersionStyle: .mixed) {
    ImmersiveView()
        .environmentObject(AppModel())
}

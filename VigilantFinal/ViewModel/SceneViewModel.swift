//
//  SceneViewModel.swift
//  VigilantFinal
//
//  Created by Jose Miguel Guerrero Jiménez on 07/06/25.
//

import Foundation
import RealityKit

@MainActor
class SceneViewModel: ObservableObject {
    @Published var selectedComponent: ComponentModel?
    
    func selectComponent(_ component: ComponentModel) {
        selectedComponent = component
    }

    func applyLoad(to component: ComponentModel, force: SIMD3<Float>) {
        // Aquí iría la lógica para modificar visualmente o lógicamente la pieza
        component.applyForce(force)
    }
}

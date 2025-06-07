//
//  firstcommit.swift
//  VigilantFinal
//
//  Created by Jose Miguel Guerrero Jiménez on 07/06/25.
//
import UIKit
import Foundation
import RealityKit

class ComponentModel: Entity, HasModel, HasCollision {

    var material: SimpleMaterial

    init(name: String, color: UIColor) {
        self.material = SimpleMaterial(color: color, isMetallic: false)
        super.init()

        self.name = name  // ✅ Usa la propiedad ya heredada de Entity
        self.components.set(ModelComponent(mesh: .generateBox(size: 0.1), materials: [material]))
        self.generateCollisionShapes(recursive: true)
    }

    required init() {
        fatalError("init() has not been implemented")
    }

    func applyForce(_ force: SIMD3<Float>) {
        // Aquí podrías implementar una animación o lógica de simulación
        let move = Transform(translation: force)
        self.move(to: move, relativeTo: self, duration: 1.0)
    }
}

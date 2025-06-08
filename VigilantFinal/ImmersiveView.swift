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
    let piezas = ["pieza1", "pieza2", "pieza3", "pieza4"]

    var body: some View {
        RealityView { content in
            // Piso invisible para que caigan objetos
            let floor = ModelEntity(mesh: .generatePlane(width: 50, depth: 50), materials: [OcclusionMaterial()])
            floor.generateCollisionShapes(recursive: false)
            floor.components.set(PhysicsBodyComponent(massProperties: .default, mode: .static))
            content.add(floor)

            // Cargar múltiples piezas
            for (index, nombre) in piezas.enumerated() {
                if let url = Bundle.main.url(forResource: nombre, withExtension: "usdc") {
                    do {
                        let entity = try await Entity(contentsOf: url)
                        if let model = findModelEntity(in: entity) {
                            model.position = SIMD3<Float>(Float(index) * 0.5, 1.0, 0)
                            model.scale = [0.1, 0.1, 0.1]

                            model.generateCollisionShapes(recursive: true)
                            model.components.set(InputTargetComponent())
                            model.components.set(PhysicsBodyComponent(
                                massProperties: .default,
                                material: .generate(staticFriction: 0.8, dynamicFriction: 0.5, restitution: 0.1),
                                mode: .dynamic
                            ))
                            model.components.set(PhysicsMotionComponent())
                            applyGrayMetalMaterial(to: model)
                            content.add(model)
                        }
                    } catch {
                        print("Error al cargar \(nombre): \(error)")
                    }
                } else {
                    print("No se encontró el archivo \(nombre).usdc")
                }
            }

        }
    }

    func applyGrayMetalMaterial(to entity: Entity) {
        if var model = entity.components[ModelComponent.self] {
            model.materials = [SimpleMaterial(color: .gray, isMetallic: true)]
            entity.components.set(model)
        }
        for child in entity.children {
            applyGrayMetalMaterial(to: child)
        }
    }

    func findModelEntity(in entity: Entity) -> Entity? {
        if entity.components.has(ModelComponent.self) {
            return entity
        }
        for child in entity.children {
            if let found = findModelEntity(in: child) {
                return found
            }
        }
        return nil
    }
}
#Preview(immersionStyle: .mixed) {
    ImmersiveView()
        .environmentObject(AppModel())
}

//
//  FEMOptionsView.swift
//  VigilantFinal
//
//  Created by Jose Miguel Guerrero Jiménez on 07/06/25.
//

import SwiftUI
import UniformTypeIdentifiers

struct FEMOptionsView: View {
    @State private var selectedTab: TabItem = .home
    @State private var isImportingFEM = false
    @State private var importedFileURL: URL?

    var body: some View {
        ZStack {
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
                    // ✅ Import FEM
                    Button(action: {
                        isImportingFEM = true
                    }) {
                        femOptionCard(imageName: "uploadicon", label: "Import FEM")
                    }

                    // Create FEM (no cambia)
                    femOptionCard(imageName: "plus", label: "Create FEM", isSystemIcon: true)
                }
                .frame(maxWidth: 800)
                .padding(.horizontal)

                Spacer()
            }
        }
        // ✅ File Importer para .usdc
        .fileImporter(
            isPresented: $isImportingFEM,
            allowedContentTypes: [UTType(filenameExtension: "usdc")!],
            allowsMultipleSelection: false
        ) { result in
            do {
                guard let selectedFile: URL = try result.get().first else { return }
                importedFileURL = selectedFile
                print("Archivo importado: \(selectedFile)")
                // Aquí puedes procesar el archivo o cargarlo
            } catch {
                print("Error al importar el archivo: \(error.localizedDescription)")
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

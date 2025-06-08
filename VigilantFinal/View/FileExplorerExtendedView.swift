//
//  FileExplorerExtendedView.swift
//  VigilantFinal
//
//  Created by Jose Miguel Guerrero Jiménez on 07/06/25.
//

import SwiftUI

struct FileExplorerExtendedView: View {
    
    @State private var selectedTab: TabItem = .home

    let mainFiles = [
        FileItem(name: "Beam", icon: "folder", hasDetail: false),
        FileItem(name: "Bolt", icon: "folder", hasDetail: false),
        FileItem(name: "Car", icon: "folder", hasDetail: false),
        FileItem(name: "Spindel", icon: "folder", hasDetail: false)
    ]
    
    let projectFiles = [
        FileItem(name: "Crankshaft", icon: "folder.fill", hasDetail: true),
        FileItem(name: "Connecting Rod", icon: "folder.fill", hasDetail: true),
        FileItem(name: "Connecting Rod", icon: "folder.fill", hasDetail: false)
    ]
    
    var body: some View {
        VStack(spacing: 16) {
            // ✅ Aquí ya funciona correctamente
            NavBar(selectedTab: $selectedTab)
            
            HStack(spacing: 16) {
                filesCard()
                    .frame(maxWidth: 300)

                VStack(spacing: 16) {
                    featureCard(imageName: "engrane", title: "Fixed Geometry")
                    featureCard(imageName: "assembly", title: "Additional Parts")
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .background(
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .cornerRadius(25)
        )
    }

    @ViewBuilder
    func filesCard() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "folder")
                Text("FILES")
                    .font(.title2)
                    .bold()
            }
            .padding(.bottom, 8)
            
            ForEach(mainFiles) { file in
                fileRow(file)
            }
            
            Divider().padding(.vertical, 4)
            
            Text("Project 1")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            ForEach(projectFiles) { file in
                fileRow(file)
            }
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(20)
    }
    
    @ViewBuilder
    func featureCard(imageName: String, title: String) -> some View {
        VStack(spacing: 8) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 100)
            
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(20)
    }
    
    @ViewBuilder
    func fileRow(_ file: FileItem) -> some View {
        HStack {
            Label(file.name, systemImage: file.icon)
                .foregroundColor(.primary)
            Spacer()
            if file.hasDetail {
                Text("")
                    .font(.caption)
                    .foregroundColor(.blue)
            }
        }
        .padding(.vertical, 6)
        .padding(.horizontal, 10)
        .background {
            if file.name == "Connecting Rod" {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white.opacity(0.2))
            } else {
                Color.clear
            }
        }
    }
}

#Preview {
    FileExplorerExtendedView()
}

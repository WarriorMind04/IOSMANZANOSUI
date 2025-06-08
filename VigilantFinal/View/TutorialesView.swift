//
//  TutorialesView.swift
//  VigilantFinal
//
//  Created by Jose Miguel Guerrero Jiménez on 08/06/25.
//

import SwiftUI

struct TutorialsView: View {
    @State private var selectedTab: TabItem = .tutorials

    let tutorials: [VideoTutorial] = [
        VideoTutorial(id: UUID(), title: "Estructuras en concreto", imageName: "tutorial 1", url: "https://www.youtube.com/watch?v=_tZCH2nTPXM"),
        VideoTutorial(id: UUID(), title: "Curso SolidWorks", imageName: "tutorial 2", url: "https://www.youtube.com/watch?v=aS464pYXzTM"),
        VideoTutorial(id: UUID(), title: "Intro a FEM", imageName: "tutorial 3", url: "https://www.youtube.com/watch?v=GHjopp47vvQ"),
        VideoTutorial(id: UUID(), title: "Solidworks", imageName: "tutorial 4", url: "https://www.youtube.com/watch?v=cHLFOBsviaA"),
        VideoTutorial(id: UUID(), title: "Editar piezas", imageName: "tutorial 5", url: "https://www.youtube.com/watch?v=O-tV7uBf5LI")
    ]

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
                        let rows = tutorials.chunked(into: 3)
                        ForEach(0..<rows.count, id: \.self) { index in
                            HStack(spacing: 30) {
                                ForEach(rows[index], id: \.id) { tutorial in
                                    Button {
                                        if let url = URL(string: tutorial.url) {
                                            UIApplication.shared.open(url)
                                        }
                                    } label: {
                                        MenuItemView(label: tutorial.title, imageName: tutorial.imageName)
                                    }
                                }
                            }
                        }
                    }

                    Spacer()
                }
                .padding(.top, 50)
            }
        }
    }
}

// Utilidad para dividir el array
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}

#Preview {
    TutorialsView()
}

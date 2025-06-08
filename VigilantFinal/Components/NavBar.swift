//
//  NavBar.swift
//  VigilantFinal
//
//  Created by Jose Miguel Guerrero Jiménez on 07/06/25.
//

import SwiftUI

struct NavBar: View {
    @Binding var selectedTab: TabItem

    var body: some View {
        HStack(spacing: 25) {
            Image(systemName: "rectangle.on.rectangle")
                .font(.title2)
                .padding(.leading, 20)

            Spacer()

            ForEach(TabItem.allCases, id: \.self) { tab in
                CapsuleTab(text: tab.rawValue, isSelected: selectedTab == tab) {
                    selectedTab = tab
                }
            }

            Spacer()

            Image(systemName: "magnifyingglass")
                .font(.title2)
                .padding(.trailing, 20)
        }
        .frame(width: 680, height: 30)
        .padding(.vertical, 10)
        .padding(.horizontal)
        .background(.ultraThinMaterial)
        .clipShape(Capsule())
        .shadow(radius: 5)
    }
}

struct CapsuleTab: View {
    var text: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Text(text)
            .font(.subheadline)
            .foregroundColor(isSelected ? .white : .black)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(isSelected ? Color.cyan.opacity(0.8) : Color.white.opacity(0.3))
            .clipShape(Capsule())
            .overlay(
                Capsule().stroke(Color.cyan.opacity(0.5), lineWidth: isSelected ? 0 : 1)
            )
            .onTapGesture {
                action()
            }
    }
}




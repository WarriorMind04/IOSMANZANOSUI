//
//  FileItem.swift
//  VigilantFinal
//
//  Created by Jose Miguel Guerrero Jiménez on 07/06/25.
//

import Foundation
struct FileItem: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    let hasDetail: Bool
}

//
//  UserInfoViewModel.swift
//  VigilantFinal
//
//  Created by Jose Miguel Guerrero Jiménez on 07/06/25.
//

import Foundation

class UserInfoViewModel: ObservableObject {
    @Published var username: String = "User 1"

    let userOptions: [String] = [
        "Email address",
        "Password",
        "Data usage",
        "Language",
        "Theme (light/dark)",
        "Privacy & Security",
        "Report issue",
        "Help",
        "Delete account",
        "Terms of use"
    ]
}

//
//  UserInfoCardView.swift
//  VigilantFinal
//
//  Created by Jose Miguel Guerrero Jiménez on 07/06/25.
//

import SwiftUI

struct UserInfoCardView: View {
    var viewModel: UserInfoViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Título
            Text("User Info")
                .font(.largeTitle).bold()

            // Perfil de usuario
            HStack(spacing: 12) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.gray)

                Text(viewModel.username)
                    .foregroundColor(.blue)
                    .font(.title3)
            }

            Divider()

            // Lista de opciones
            ForEach(viewModel.userOptions, id: \.self) { option in
                HStack {
                    Text(option)
                        .foregroundColor(.primary)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 8)

                Divider()
            }
        }
        .padding()
        .frame(maxWidth: 800)
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .padding(.horizontal)
    }
}

#Preview {
    UserInfoCardView(viewModel: UserInfoViewModel())
}

#Preview {
    UserInfoCardView(viewModel: UserInfoViewModel())
}

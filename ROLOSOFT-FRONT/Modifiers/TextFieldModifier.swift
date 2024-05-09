//
//  TextFieldModifier.swift
//  ROLOSOFT-FRONT
//
//  Created by Juan Camilo Bedoya Barbosa on 8/05/24.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
            .frame(height: 48)
            .padding(.horizontal, 12)
            .background(Color.white)
            .cornerRadius(8)
            .autocapitalization(.none)
            .overlay(RoundedRectangle(cornerRadius: 8) // This will add the border
                .stroke(Color(red: 219 / 255, green: 219 / 255, blue: 255 / 219), lineWidth: 1))
    }
}

//
//  Modifiers.swift
//  final ass
//
//  Created by Triet, Luu Huynh on 06/09/2022.
//

import Foundation
import SwiftUI

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color("base"))
            .frame(width: 250, height: 50)
    }
}

struct TextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color("base"))
    }
}

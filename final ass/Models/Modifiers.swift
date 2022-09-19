//
//  Modifiers.swift
//  final ass
//
//  Created by Tri, Luu Huynh on 06/09/2022.
//

import Foundation
import SwiftUI

private var textFieldWidth: CGFloat = 250
private var textFieldHeight: CGFloat = 20

struct textField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: textFieldWidth, height: textFieldHeight, alignment: .center)
            .padding(10)
            .textFieldStyle(.roundedBorder)
    }
}

struct titleView: ViewModifier {
    func body(content: Content) -> some View {
        content
            .fixedSize()
            .font(.system(size: 60))
            .offset(y: -150)
    }
}

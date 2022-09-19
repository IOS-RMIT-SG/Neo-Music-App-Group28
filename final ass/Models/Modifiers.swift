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
            .textFieldStyle(CustomTextFieldStyle())
            .foregroundColor(Color("input"))
    }
}

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .background(Color("base"))
                
    }
}

struct titleView: ViewModifier {
    func body(content: Content) -> some View {
        content
            .fixedSize()
            .font(.system(size: 60))
//            .offset(y: -150)
    }
}

struct buttonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 100, height: 30, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 5).fill(Color("base")))
            .foregroundColor(Color("input"))
    }
}

struct textModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 200, height: 20, alignment: .center)
    }
}

struct textColor: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color("base"))
    }
}

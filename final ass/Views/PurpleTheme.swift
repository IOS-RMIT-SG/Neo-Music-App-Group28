//
//  LightView.swift
//  final ass
//
//  Created by Triet, Luu Huynh on 06/09/2022.
//

import SwiftUI

struct PurpleTheme: View {
    let purple = Gradient(colors: [Color("blue"), Color("Boundary"), Color("blue")])
        var body: some View {
            ZStack {
                LinearGradient(gradient: purple, startPoint: .topTrailing, endPoint: .topLeading)
                    .edgesIgnoringSafeArea(.all)
            }
        }
}

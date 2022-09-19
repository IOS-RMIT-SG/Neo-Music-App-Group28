//
//  FireTheme.swift
//  final ass
//
//  Created by Duc, Nguyen Trung on 19/09/2022.
//

import SwiftUI

struct FireTheme: View {
    let red = Gradient(colors: [Color("red"), Color("yellowtheme"), Color("red")])
    
    var body: some View {
            ZStack {
                LinearGradient(gradient: red, startPoint: .topTrailing, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
            }
        }
}

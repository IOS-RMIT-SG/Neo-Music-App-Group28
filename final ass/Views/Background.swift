//
//  LightView.swift
//  final ass
//
//  Created by Triet, Luu Huynh on 06/09/2022.
//

import SwiftUI

struct Background: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("blue"), Color("boundary"), Color("blue")], startPoint: .topTrailing, endPoint: .topLeading).edgesIgnoringSafeArea(.all)
        }
    }
}

struct BackgroundPreviews: PreviewProvider {
    static var previews: some View {
        Background()
        
        Background()
            .environment(\.colorScheme, .dark)
    }
}

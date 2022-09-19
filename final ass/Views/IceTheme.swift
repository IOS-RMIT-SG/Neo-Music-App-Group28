//
//  IceTheme.swift
//  final ass
//
//  Created by Duc, Nguyen Trung on 19/09/2022.
//

import SwiftUI

struct IceTheme: View {
    let cyan = Gradient(colors: [Color("outlier"), Color("cyan"), Color("outlier")])
        
    var body: some View {
            ZStack {
                LinearGradient(gradient: cyan, startPoint: .topTrailing, endPoint: .topLeading)
                    .edgesIgnoringSafeArea(.all)
            }
        }
}

struct IceTheme_Previews: PreviewProvider {
    static var previews: some View {
        IceTheme()
    }
}

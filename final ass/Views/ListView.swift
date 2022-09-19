//
//  ListView.swift
//  final ass
//
//  Created by Triet, Luu Huynh on 06/09/2022.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        ZStack {
            NavigationView {
                Background()
                List {
                    Text("Hello")
                        
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
        
        ListView()
            .environment(\.colorScheme, .dark)
    }
}

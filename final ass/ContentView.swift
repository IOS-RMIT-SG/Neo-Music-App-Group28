//
//  ContentView.swift
//  final ass
//
//  Created by Duc, Nguyen Trung on 05/09/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var audioManager = AudioManager()
    
    var body: some View {
        MyTabView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 3
 Author: Group 28
 Created  date: 05/09/2022
 Last modified: 20/09/2022
 */

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

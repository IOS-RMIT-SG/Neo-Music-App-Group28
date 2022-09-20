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

struct FireTheme: View {
    let red = Gradient(colors: [Color("red"), Color("yellowtheme"), Color("red")])
    
    var body: some View {
            ZStack {
                LinearGradient(gradient: red, startPoint: .topTrailing, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
            }
        }
}

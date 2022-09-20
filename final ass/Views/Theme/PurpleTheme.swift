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

struct PurpleTheme: View {
    let purple = Gradient(colors: [Color("blue"), Color("Boundary"), Color("blue")])
        var body: some View {
            ZStack {
                LinearGradient(gradient: purple, startPoint: .topTrailing, endPoint: .topLeading)
                    .edgesIgnoringSafeArea(.all)
            }
        }
}

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

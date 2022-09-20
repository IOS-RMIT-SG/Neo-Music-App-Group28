/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Group 28
  Created  date: 05/09/2022
  Last modified: 20/09/2022
*/

import Foundation
import SwiftUI

private var textFieldWidth: CGFloat = 250
private var textFieldHeight: CGFloat = 20

//MARK: Text field
struct textField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: textFieldWidth, height: textFieldHeight, alignment: .center)
            .padding(10)
            .textFieldStyle(CustomTextFieldStyle())
            .foregroundColor(Color("input"))
    }
}

//MARK: Custom text field
struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .background(Color("base"))
                
    }
}

//MARK: Title view
struct titleView: ViewModifier {
    func body(content: Content) -> some View {
        content
            .fixedSize()
            .font(.system(size: 60))
    }
}

//MARK: Button view
struct buttonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 100, height: 30, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 5).fill(Color("base")))
            .foregroundColor(Color("input"))
    }
}

//MARK: Text view
struct textModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 200, height: 20, alignment: .center)
    }
}

//MARK: Text color
struct textColor: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color("base"))
    }
}

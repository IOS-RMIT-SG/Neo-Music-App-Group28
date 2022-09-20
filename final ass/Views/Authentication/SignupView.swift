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
import Firebase

struct SignupView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var passVerification: String = ""
    @State private var signUpNotification: Double = 0
    @State private var isPassCorrect: Bool = false
    
    func checkMatchPassword() -> Bool {
        if (password == passVerification) {
            return true
        }
        return false
    }
    
    func signUp() {
        Auth.auth().createUser(withEmail: username, password: password) {authResult, error in
            if error != nil {
                print(error?.localizedDescription ?? "")
                signUpNotification = 1
            } else {
                print("success")
                dismiss()
            }
        }
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 30) {
                Text("SIGN UP")
                    .modifier(titleView())
                VStack {
                    //MARK: Username
                    HStack(spacing: 10){
                        Text("Username")
                        TextField(
                            "Type in your username",
                            text: $username
                        ).modifier(textField())
                            .disableAutocorrection(true)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    
                    //MARK: PAssword
                    HStack(spacing: 10){
                        Text("Password")
                        SecureField(
                            "Type in your password",
                            text: $password
                        ).modifier(textField())
                            .disableAutocorrection(true)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    //MARK: Repeat password
                    HStack(spacing: 10) {
                        Text("Repeat Pass")
                        SecureField(
                            "Type your password again",
                            text: $passVerification
                        ).modifier(textField())
                            .disableAutocorrection(true)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }.padding(.horizontal, 10)
                
                
                Text("Password does not match")
                    .modifier(textField())
                    .opacity(signUpNotification)
                
                //MARK: Signup button
                Button(action: {
                    signUp()
                }) {
                    Text("SIGN UP")
                }.modifier(buttonModifier())
                
                //MARK: Cancel bt
                Button("CANCEL") {
                    dismiss()
                }.modifier(buttonModifier())
            }
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}

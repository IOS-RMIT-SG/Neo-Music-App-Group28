//
//  SignupView.swift
//  final ass
//
//  Created by Tri, Luu Huynh on 10/09/2022.
//

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
                    TextField(
                        "Type in your username",
                        text: $username
                    ).modifier(textField())
                        .disableAutocorrection(true)
                    
                    //MARK: PAssword
                    SecureField(
                        "Type in your password",
                        text: $password
                    ).modifier(textField())
                        .disableAutocorrection(true)
                    
                    //MARK: Repeat password
                    SecureField(
                        "Type your password again",
                        text: $passVerification
                    ).modifier(textField())
                        .disableAutocorrection(true)
                }
                
                
                Text("Password does not match")
                    .modifier(textField())
                    .opacity(signUpNotification)
                
                //MARK: Signup button
                Button(action: {
                    signUp()
                }) {
                    Text("SIGN UP")
                        .modifier(textField())
                }
                
                //MARK: Cancel bt
                Button("CANCEL") {
                    dismiss()
                }
            }
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}

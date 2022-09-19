//
//  LoginView.swift
//  final ass
//

//  Created by Triet, Luu Huynh on 06/09/2022.
//  Created by Tri, Luu Huynh on 06/09/2022.

//

import SwiftUI
import Firebase

struct LoginView: View {
    @EnvironmentObject var user: LocalUser
    
    @State private var logInNotification: Double = 0
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var logInSuccess = false
    @State private var showPage = false
    
    func logIn() {
        Auth.auth().signIn(withEmail: username, password: password) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? " ")
                logInNotification = 1
                logInSuccess = false
            } else {
                print("success")
                logInSuccess = true
                user.username = self.username
            }
        }
    }
 
    var body: some View {
        ZStack {
            
            VStack(alignment: .center, spacing: 30) {
                Text("NEO MUSIC")
                    .modifier(titleView())
                VStack {
                    //MARK: Username field
                    TextField(
                        "User name",
                        text: $username
                    )
                    .modifier(textField())
                    .disableAutocorrection(true)
                    
                    //MARK: Password field
                    SecureField (
                        "Password",
                        text: $password
                    )
                    .modifier(textField())
                    .disableAutocorrection(true)
                }
                
                //MARK: Login bt
                Text("LOG IN FAIL")
                    .modifier(textField())
                    .opacity(logInNotification)
                
                Button(action: {
                    logIn()
                }) {
                    Text("LOG IN").modifier(textField())
                }
                
                //MARK: Register bt
                Button("REGISTER") {
                    showPage = true
                }
            }
        }.fullScreenCover(isPresented: $showPage, content: {
            SignupView()
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
        
        LoginView()
            .environment(\.colorScheme, .dark)

    }
}

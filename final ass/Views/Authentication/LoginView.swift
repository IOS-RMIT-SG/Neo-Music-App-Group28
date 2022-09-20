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
                VStack() {
                    //MARK: Username field
                    HStack(spacing: 10){
                        Text("Username")
                        TextField(
                            "User name",
                            text: $username
                        )
                        .modifier(textField())
                        .disableAutocorrection(true)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    
                    //MARK: Password field
                    HStack(spacing: 10){
                        Text("Password")
                        SecureField (
                            "Password",
                            text: $password
                        )
                        .modifier(textField())
                        .disableAutocorrection(true)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }.padding(.horizontal, 10)
                
                //MARK: Login bt
                Text("LOG IN FAIL")
                    .modifier(textColor())
                    .opacity(logInNotification)
                
                Button(action: {
                    logIn()
                }) {
                    Text("LOG IN").modifier(buttonModifier())
                }
                
                //MARK: Register bt
                Button("REGISTER") {
                    showPage = true
                }
                .modifier(buttonModifier())
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

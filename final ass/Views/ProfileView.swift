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

enum AuthPages{
    case Login, Register
}

struct ProfileView: View {
    @EnvironmentObject var user: LocalUser
    
    @State private var showPage = false
    @State private var authPages: AuthPages? = .Login
    @State private var settings = false
    
    var body: some View {
        ZStack{
            if user.username == "" {
                //MARK: Login view
                LoginView()
            } else {
                //MARK: Profile view
                VStack {
                    Image("avatar-blank")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .frame(width: 100, height: 100)
                        .overlay(Circle().stroke(Color(.gray),lineWidth: 5))
                        .padding()
                    Text("\(user.username)")
                        .font(.system(size: 20))
                        .padding()  
                    Button (action: {
                        settings = true
                    }, label: {
                        Text("SETTINGS")
                    })
                    .modifier(buttonModifier())
                    .padding()
                    .sheet(isPresented: $settings, content: {
                        Settings()
                    })
                    Button("LOGOUT") {
                        user.username = ""
                        }
                    .modifier(buttonModifier())
                    }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(LocalUser())
    }
}

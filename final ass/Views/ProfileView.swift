//
//  ProfileView.swift
//  final ass
//
//  Created by Duc, Nguyen Trung on 13/09/2022.
//

import SwiftUI

enum AuthPages{
    case Login, Register
}

struct ProfileView: View {
    @EnvironmentObject var user: LocalUser
    
    @State private var showPage = false
    @State private var authPages: AuthPages? = .Login
    
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
                    Text("Setting")
                        .padding(40)
                    Button("LOGOUT") {
                        user.username = ""
                        }
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

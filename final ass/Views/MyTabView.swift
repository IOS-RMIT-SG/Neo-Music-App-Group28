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

struct MyTabView: View {
    @StateObject var user = LocalUser()
    @StateObject var dataManager = DataManager()
    @StateObject var audioManager = AudioManager()
    
    var body: some View {
        TabView{
            HomeView().tabItem{
                Label("Home", systemImage: "house")
            }.environmentObject(dataManager)
                .environmentObject(audioManager)
                .environmentObject(user)
            
            SongListView().tabItem{
                Label("Songs", systemImage: "music.note.list")
            }.environmentObject(dataManager)
                .environmentObject(audioManager)
                .environmentObject(user)
            
            MyFavoriteView().tabItem{
                Label("My Favorite", systemImage: "music.house")
            }.environmentObject(dataManager)
                .environmentObject(audioManager)
                .environmentObject(user)

            ProfileView().tabItem{
                Label("Profile", systemImage: "person.crop.circle")
            }.environmentObject(user)
        }.accentColor(.pink)
    }
}

struct MyTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView()
    }
}

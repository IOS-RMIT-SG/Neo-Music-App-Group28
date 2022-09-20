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

struct MyFavoriteView: View {
    @EnvironmentObject var dataManager: DataManager
    @EnvironmentObject var user: LocalUser
    
    @State private var searchText: String = ""
    @State private var changePage = false
    @State private var song: Song? = nil
    
    var body: some View {
        ZStack{
            if user.username == "" {
                //MARK: Progress view
                Text("Login to manage your favorite songs").font(.title2)
            } else {
                //MARK: favorite songs
                ZStack {
                    if dataManager.favoriteSongs.isEmpty {
                        Text("Add songs to your library")
                    } else {
                        NavigationView {
                            List(dataManager.favoriteSongs) { song in
                                SongLabel(song: song, action: {
                                    changePage = true
                                    self.song = song
                                })
                            }.navigationTitle("List of your favorite")
                        }.fullScreenCover(item: $song, content: {item in
                            SongView(song: item)
                        })
                    }
                }.onAppear{
                    dataManager.fetchFavorite(user: user.username)
                }
            }
        }
    }
}

struct MyFavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        MyFavoriteView()
    }
}

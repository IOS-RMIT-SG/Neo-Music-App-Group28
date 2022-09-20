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

struct SongListView: View {
    @EnvironmentObject var dataManager: DataManager
    
    @State private var searchText: String = ""
    @State private var changePage = false
    @State private var song: Song? = nil
    
    
    var body: some View {
        ZStack{
            if dataManager.songs.isEmpty {
                //MARK: Progress view
                ProgressView()
            } else {
                //MARK: All songs
                NavigationView {
                    List(dataManager.songs) { song in
                        SongLabel(song: song, action: {
                            changePage = true
                            self.song = song
                        })
                    }.navigationTitle("List of songs")
                }.fullScreenCover(item: $song, content: {item in
                    SongView(song: item)
                })
            }
        }.onAppear{
            dataManager.fetchSongs()
        }
    }
}

struct SongListView_Previews: PreviewProvider {
    static var previews: some View {
        SongListView()
    }
}

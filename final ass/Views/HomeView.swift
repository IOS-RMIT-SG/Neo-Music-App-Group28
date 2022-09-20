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

struct HomeView: View {
    @EnvironmentObject var dataManager: DataManager
    
    @State private var changePage = false
    @State private var song: Song? = nil
    @State private var query = ""
    private let columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        VStack {
            ScrollView {
                //MARK: Title
                Text("Top 4 popular songs").font(.title).bold().padding(.top, 10)
                
                //MARK: Top 4 songs
                if dataManager.popularSongs.isEmpty {
                    ProgressView()
                } else {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(dataManager.popularSongs, id: \.id) { song in
                            SongCard(song: song, action: {
                                changePage = true
                                self.song = song
                            })
                        }
                    }.padding()
                }
                
                Text("Filter songs").bold()
                
                //MARK: FIlter bar
                HStack {
                    ForEach(Query.allCases,id: \.self) { searchQuery in
                        QueryTag(query: searchQuery, isSelected: query == searchQuery.rawValue).onTapGesture {
                            query = searchQuery.rawValue
                            dataManager.querySongs(query: query)
                        }
                    }
                }
                
                //MARK: FIltered songs
                if dataManager.filteredSongs.isEmpty && query != "" {
                    ProgressView()
                } else {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(dataManager.filteredSongs, id: \.id) { song in
                            SongCard(song: song, action: {
                                changePage = true
                                self.song = song
                            })
                        }
                    }.padding()
                }
            }.frame(maxWidth: .infinity)
        }.fullScreenCover(item: $song, content: {item in
            SongView(song: item)
        })
        .onAppear{
            dataManager.fetchTop5Songs()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

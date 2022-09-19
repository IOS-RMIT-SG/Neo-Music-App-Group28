//
//  Song.swift
//  final ass
//
//  Created by Duc, Nguyen Trung on 06/09/2022.
//

import Foundation

final class SongViewModel: ObservableObject {
    private(set) var song: Song
    
    
    init(song: Song) {
        self.song = song
    }
}

struct Song: Identifiable, Equatable {
    let id: String
    let title: String
    let description: String
    let duration: TimeInterval
    let track: String
    let image: String
    var popularity: Int
    let file: String
    let artist: String
    let genre: String
    
    static let data = [ Song(id: "1", title: "Title dasdsdas", description: "Description", duration: 59, track: "ass2_Sound_BattleTheme", image: "image-feather", popularity: 0, file: "", artist: "", genre: ""),
                        Song(id: "2", title: "God's Plan", description: "This is Drake song, rap blah blah", duration: 198, track: "Drake_God_s_Plan", image: "godsplan", popularity: 0, file: "",artist: "", genre: ""),
                        Song(id: "3", title: "Baby Shark", description: "baby shark doo doo doo", duration: 93, track:"Pinkfong_Baby_Shark", image: "babyshark", popularity: 0, file: "",artist: "", genre: ""),
                        Song(id: "4", title: "Baby One More Time", description: "Britney Spears", duration: 121, track: "Britney_Spears_Baby_One_More_Time", image: "babyonemoretime", popularity: 0, file: "",artist: "", genre: "")
    ]
    
    
    static func all() -> [Song] {
        return [
            Song(id: "1", title: "Title dasdsdas", description: "Description", duration: 59, track: "ass2_Sound_BattleTheme", image: "image-feather", popularity: 0, file: "",artist: "", genre: ""),
                                Song(id: "2", title: "God's Plan", description: "This is Drake song, rap blah blah", duration: 198, track: "Drake_God_s_Plan", image: "godsplan", popularity: 0, file: "",artist: "", genre: ""),
                                Song(id: "3", title: "Baby Shark", description: "baby shark doo doo doo", duration: 93, track:"Pinkfong_Baby_Shark", image: "babyshark", popularity: 0, file: "",artist: "", genre: ""),
                                Song(id: "4", title: "Baby One More Time", description: "Britney Spears", duration: 121, track: "Britney_Spears_Baby_One_More_Time", image: "babyonemoretime", popularity: 0, file: "",artist: "", genre: "")
           ]
    }
}

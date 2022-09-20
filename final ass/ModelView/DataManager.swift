/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Group 28
  Created  date: 05/09/2022
  Last modified: 20/09/2022
*/

import Foundation
import Firebase
import CoreMedia
import FirebaseStorage

enum SongAttr: String{
    case title, description, duration, track, image, popularity
}

class DataManager: ObservableObject {
    @Published var songs: [Song] = []
    @Published var favoriteSongs: [Song] = []
    @Published var popularSongs: ArraySlice<Song> = []
    @Published var filteredSongs: [Song] = []
    @Published var isAdded = false
    @Published var noResult = false
    private var db = Firestore.firestore()
    
    //MARK: Fetch all songs
    func fetchSongs() {
        songs.removeAll()
        db.collection("Songs").addSnapshotListener{(querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.songs = documents.map{(queryDocumentSnapshot) -> Song in
                let data = queryDocumentSnapshot.data()
                
                let id = queryDocumentSnapshot.documentID
                let title = data["title"] as? String ?? ""
                let description = data["description"] as? String ?? ""
                let duration = data["duration"] as? Double ?? 0
                let track = data["track"] as? String ?? ""
                let image = data["image"] as? String ?? ""
                let popularity = data["popularity"] as? Int ?? 0
                let file = data["file"] as? String ?? ""
                let artist = data["artist"] as? String ?? ""
                let genre = data["genre"] as? String ?? ""
                
                return Song(id: id, title: title, description: description, duration: duration, track: track, image: image, popularity: popularity, file: file, artist: artist, genre: genre)
            }
        }
    }
    
    //MARK: Fetch top 5 songs
    func fetchTop5Songs() {
        songs.removeAll()
        popularSongs.removeAll()
        db.collection("Songs").addSnapshotListener{(querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.songs = documents.map{(queryDocumentSnapshot) -> Song in
                let data = queryDocumentSnapshot.data()
                
                let id = queryDocumentSnapshot.documentID
                let title = data["title"] as? String ?? ""
                let description = data["description"] as? String ?? ""
                let duration = data["duration"] as? Double ?? 0
                let track = data["track"] as? String ?? ""
                let image = data["image"] as? String ?? ""
                let popularity = data["popularity"] as? Int ?? 0
                let file = data["file"] as? String ?? ""
                let artist = data["artist"] as? String ?? ""
                let genre = data["genre"] as? String ?? ""
                
                return Song(id: id, title: title, description: description, duration: duration, track: track, image: image, popularity: popularity, file: file, artist: artist, genre: genre)
            }.sorted {
                $0.popularity > $1.popularity
            }
            if self.songs.count >= 4 {
                self.popularSongs = self.songs[0...3]
            }
        }
    }
    
    //MARK: Fetch all favorite songs
    func fetchFavorite(user: String) {
        favoriteSongs.removeAll()
        db.collection("\(user) songs").addSnapshotListener{(querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.favoriteSongs = documents.map{(queryDocumentSnapshot) -> Song in
                let data = queryDocumentSnapshot.data()
                
                let id = queryDocumentSnapshot.documentID
                let title = data["title"] as? String ?? ""
                let description = data["description"] as? String ?? ""
                let duration = data["duration"] as? Double ?? 0
                let track = data["track"] as? String ?? ""
                let image = data["image"] as? String ?? ""
                let popularity = data["popularity"] as? Int ?? 0
                let file = data["file"] as? String ?? ""
                let artist = data["artist"] as? String ?? ""
                let genre = data["genre"] as? String ?? ""
                
                return Song(id: id, title: title, description: description, duration: duration, track: track, image: image, popularity: popularity, file: file, artist: artist, genre: genre)
            }
        }
    }
    
    //MARK: CHeck if songs exist
    func checkIsAdded(user: String, song: Song) {
        let docRef = db.collection("\(user) songs").whereField("title", isEqualTo: song.title).limit(to: 1)
        docRef.getDocuments{(querysnapshot, error) in
            if error != nil {
                print("Document Error:", error ?? "error")
            } else {
                if let doc = querysnapshot?.documents, !doc.isEmpty {
                    self.isAdded = true
                    print("exits")
                } else {
                    self.isAdded = false
                    print("not")
                }
            }
        }
    }
    
    //MARK: Add songs to your favorite
    func addSongToFavorite(user: String, song: Song) {
        db.collection("\(user) songs").document(song.id).setData([
            "title": song.title,
            "description": song.description,
            "duration": song.duration,
            "file": song.file,
            "id": song.id,
            "image": song.image,
            "popularity": song.popularity,
            "track": song.track
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                self.isAdded = true
                print("Document successfully written!")
            }
        }
    }
    
    
    //MARK: remove songs from your favorite
    func removeSongFromFavorite(user: String, song: Song) {
        db.collection("\(user) songs").document(song.id).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                self.isAdded = false
                print("Document successfully removed!")
            }
        }
    }
    
    //MARK: Update song popularity
    func updateSongPopularity(song: Song) {
        let popularity = song.popularity + 1
        db.collection("Songs").document(song.id).setData([ "popularity": popularity ], merge: true) {error in
            if let err = error {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated!")
            }
        }
    }
    
    //MARK: control icon
    func modifySystemName() -> String {
        if (self.isAdded) {
            return "heart.fill"
        } else {
            return "heart"
        }
    }
    
    //MARK: Query song by genre
    func querySongs(query: String) {
        noResult = false
        let docRef = db.collection("Songs").whereField("genre", isEqualTo: query)
        docRef.getDocuments{(querysnapshot, error) in
            guard let documents = querysnapshot?.documents else {
                self.noResult = true
                print("No documents")
                return
            }
            
            self.filteredSongs = documents.map{(queryDocumentSnapshot) -> Song in
                let data = queryDocumentSnapshot.data()
                
                let id = queryDocumentSnapshot.documentID
                let title = data["title"] as? String ?? ""
                let description = data["description"] as? String ?? ""
                let duration = data["duration"] as? Double ?? 0
                let track = data["track"] as? String ?? ""
                let image = data["image"] as? String ?? ""
                let popularity = data["popularity"] as? Int ?? 0
                let file = data["file"] as? String ?? ""
                let artist = data["artist"] as? String ?? ""
                let genre = data["genre"] as? String ?? ""
                
                return Song(id: id, title: title, description: description, duration: duration, track: track, image: image, popularity: popularity, file: file, artist: artist, genre: genre)
            }
        }
    }
}

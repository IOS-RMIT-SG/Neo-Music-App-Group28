//
//  AudioManager.swift
//  final ass
//
//  Created by Duc, Nguyen Trung on 06/09/2022.
//

import Foundation
import AVKit
import AVFoundation
import FirebaseStorage

final class AudioManager: ObservableObject {

    var mvPlayer: AVPlayer?
    @Published private(set) var isPlaying = false
    @Published private(set) var url = ""
    
    //MARK: play mv
    func playMvWithURL(song: Song, isPreview: Bool = false) {
        let storage = Storage.storage().reference(forURL: song.file)
        storage.downloadURL{(url, error) in
            if error != nil {
                print(error ?? "error")
            } else {
                self.mvPlayer = AVPlayer(url: url!)
                self.mvPlayer?.play()
            }
        }
    }
}

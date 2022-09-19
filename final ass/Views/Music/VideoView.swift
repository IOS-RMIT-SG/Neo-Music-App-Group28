//
//  VideoView.swift
//  final ass
//
//  Created by Duc, Nguyen Trung on 18/09/2022.
//

import SwiftUI
import AVFoundation
import AVKit
import FirebaseStorage

struct VideoView: View {
    var song: Song
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var audioManager: AudioManager
    
    var body: some View {
        ZStack {
            //MARK: Video player view
            VideoPlayer(player: audioManager.mvPlayer).edgesIgnoringSafeArea(.all)
                .onAppear{
                    audioManager.playMvWithURL(song: song)
                }
                .onDisappear{
                    audioManager.mvPlayer?.pause()
                }
        }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(song: Song.data[0])
    }
}

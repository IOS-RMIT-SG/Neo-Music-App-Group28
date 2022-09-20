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

struct SongCard: View {
    var song: Song
    var action: () -> Void
    
    var body: some View {
        ZStack {
            ZStack(alignment: .bottomLeading) {
                //MARK: background image
                Image(song.image).resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 160, height: 250)
                    .cornerRadius(30)
                    .onTapGesture {
                        action()
                    }
                
                //MARK: Information
                VStack(alignment: .leading) {
                    Text(song.title).font(.caption).bold()
                    
                    Text("By \(song.artist)").font(.caption).bold()
                        .multilineTextAlignment(.leading)
                }.foregroundColor(.white)
                    .shadow(radius: 20)
                    .padding()
            }
            
            //MARK: icon
            Image(systemName: "play.fill").foregroundColor(.white)
                .font(.title)
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(50)
                .opacity(0.8)
                .onTapGesture {
                    action()
                }
        }.onTapGesture {
            action()
        }
    }
}

struct SongCard_Previews: PreviewProvider {
    static var previews: some View {
        SongCard(song: Song.data[0], action: {})
    }
}

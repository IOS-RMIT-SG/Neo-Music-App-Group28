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
import FirebaseStorage

struct SongLabel: View {
    var song: Song
    var action: () -> Void
    
    var body: some View {
        HStack {
            //MARK: Image
            Image(song.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipped()
            
            //MARK: Title
            VStack(alignment: .leading) {
                Text(song.title)
                    .font(.system(size: 21, weight: .medium, design: .default))
                    .padding()
            }
            Spacer()
        }.padding([.leading,.trailing], 24)
            .onTapGesture {
                action()
            }
    }
}

struct SongLabel_Previews: PreviewProvider {
    static var previews: some View {
        SongLabel(song: Song.data[0], action: {})
    }
}

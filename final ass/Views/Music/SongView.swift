//
//  SongView.swift
//  final ass
//
//  Created by Duc, Nguyen Trung on 05/09/2022.
//

import SwiftUI

struct SongView: View {
    
    var song: Song
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var dataManager: DataManager
    @EnvironmentObject var user: LocalUser
    @State private var playMusic = false;
    
   
    
    var body: some View {
        
        VStack(spacing: 0){
            //MARK: Image
            
            Image(song.image).resizable().scaledToFill().frame(height: UIScreen.main.bounds.height/2)
            
            
            //MARK: Background
            
            ZStack{
                
                Color(red: 24/255, green: 23/255, blue: 22/255)
                ScrollView{
                    VStack(alignment: .leading, spacing: 24) {
                        HStack{
                            Image(systemName: "chevron.left.2").frame(maxWidth: .infinity, alignment: .leading).onTapGesture {
                                dismiss()
                            }
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Music")
                                
                                Text(DateComponentsFormatter.abbreviated.string(from: song.duration) ??
                                     "\(song.duration.formatted()) S")
                            }.font(.subheadline)
                                .textCase(.uppercase)
                                .opacity(0.7)
                        }
                     
                        
                        //MARK: Title
                        HStack {
                            Text(song.title).font(.title)
                            Spacer()
                            
                            Image(systemName: dataManager.modifySystemName()).foregroundColor(.red).onTapGesture {
                                if user.username != "" && !dataManager.isAdded {
                                    dataManager.addSongToFavorite(user: user.username, song: song)
                                } else if user.username != "" && dataManager.isAdded {
                                    dataManager.removeSongFromFavorite(user: user.username, song: song)
                                }
                            }
                        }
                        
                        //MARK: Play button
                        Button {
                            playMusic = true
                            dataManager.updateSongPopularity(song: song)
                        } label: {
                            Label("Play", systemImage: "play.fill")
                                .font(.headline)
                                .foregroundColor(.black)
                                .padding(.vertical, 10)
                                .frame(maxWidth: .infinity)
                                .background(.white)
                                .cornerRadius(20)
                        }
                        
                        //MARK: Description
                        Text(song.description)
                        //Push to top
                        Spacer()
                    }.foregroundColor(.white)
                        .padding(20)
                }.frame(height: UIScreen.main.bounds.height*0.6)
            }
        }.edgesIgnoringSafeArea(.all)
            .fullScreenCover(isPresented: $playMusic, content: {
                //PlayerView(song: song)
                VideoView(song: song)
            })
            .onAppear{
                if (user.username != "") {
                    dataManager.checkIsAdded(user: user.username, song: song)
                }
            }
    }
}

struct SongView_Previews: PreviewProvider {
    static let songVM = SongViewModel(song: Song.data[1])
    static var previews: some View {
        SongView(song: Song.data[1]).environmentObject(AudioManager())
    }
}

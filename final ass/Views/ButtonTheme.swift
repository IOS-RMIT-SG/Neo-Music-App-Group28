//
//  ButtonTheme.swift
//  final ass
//
//  Created by Triet, Luu Huynh on 14/09/2022.
//
import SwiftUI

struct ButtonTheme: View {
    @State var purpletheme = true
    @State var firetheme = false
    @State var icetheme = false
    
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @State private var isDarkMode = false
    
    func setAppMode() {
            isDarkMode = UserUtils.shared.getDarkMode()
            changeDarkMode(state: isDarkMode)
            
            if colorScheme == .dark {
                isDarkMode = true
            } else {
                isDarkMode = false
            }
            changeDarkMode(state: isDarkMode)
        }
    
    func changeDarkMode(state: Bool) {
            (UIApplication.shared.connectedScenes.first as?
             UIWindowScene)?.windows.first!.overrideUserInterfaceStyle = state ? .dark : .light
            UserUtils.shared.setDarkMode(enable: state)
        }
    
    var ToggleModeView: some View {
            Toggle("dark", isOn: $isDarkMode).onChange(of: isDarkMode) {
                modestate in
                changeDarkMode(state: modestate)
            }.labelsHidden()
        }
    
    var body: some View {
        ZStack {
            if purpletheme == true {
                PurpleTheme()
            } else if firetheme == true {
                FireTheme()
            } else {
                IceTheme()
            }
            VStack {
                Text("Mode Switch")
                                ToggleModeView
                                    .onAppear(perform: {
                                        setAppMode()
                                    })
            }
            VStack {
                Button(action: {
                    purpletheme = true
                    firetheme = false
                    icetheme = false
                }, label: {
                    Text("Blue Theme")
                })
                .modifier(buttonModifier())
                
                Button(action: {
                    firetheme = true
                    purpletheme = false
                    icetheme = false
                }, label: {
                    Text("Fire Theme")
                })
                .modifier(buttonModifier())
                
                Button(action: {
                    icetheme = true
                    purpletheme = false
                    firetheme = false
                }, label: {
                    Text("Ice Theme")
                })
                .modifier(buttonModifier())
            }
            .position(x: 195, y: 280)
            
            Text("Title")
                .font(.system(size: 50))
                .offset(y: -200)
        }
    }
}

struct ButtohTheme_Previews: PreviewProvider {
    static var previews: some View {
        ButtonTheme()
    }
}

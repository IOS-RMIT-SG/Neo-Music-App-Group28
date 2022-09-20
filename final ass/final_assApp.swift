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
import Firebase

@main
struct final_assApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

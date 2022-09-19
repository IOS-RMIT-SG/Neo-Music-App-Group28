//
//  final_assApp.swift
//  final ass
//
//  Created by Duc, Nguyen Trung on 05/09/2022.
//
//
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

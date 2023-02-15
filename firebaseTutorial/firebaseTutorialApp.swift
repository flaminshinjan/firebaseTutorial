//
//  firebaseTutorialApp.swift
//  firebaseTutorial
//
//  Created by Shinjan Patra on 13/02/23.
//

import SwiftUI
import Firebase

@main
struct firebaseTutorialApp: App {
    @StateObject var dataManager = DataManager()
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ListView()
                .environmentObject(dataManager)
        }
    }
}

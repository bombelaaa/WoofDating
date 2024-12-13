//
//  DogDatingApp.swift
//  DogDating
//
//  Created by Jimy on 10/10/24.
//

import SwiftUI

@main
struct DogDatingApp: App {
    @StateObject var matchManager = MatchManager()
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(matchManager)
        }
    }
}

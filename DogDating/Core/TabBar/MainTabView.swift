//
//  MainTabView.swift
//  DogDating
//
//  Created by Jimy on 10/10/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            CardStackView()
                .tabItem {
                    Image(systemName: "pawprint")
                        .imageScale(.large)
                } .tag(0)
            Text("Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                } .tag(1)
            
            Text("Inbox")
                .tabItem {
                    Image(systemName: "bubble")
                } .tag(2)
            
            CurrentUserProfileView(user: MockData.users[2])
                .tabItem {
                    Image(systemName: "dog.fill")
                } .tag(3)
        }
        .tint(.primary)
    }
        
}

#Preview {
    MainTabView()
        .environmentObject(MatchManager())
}

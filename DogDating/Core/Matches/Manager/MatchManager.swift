//
//  MatchManager.swift
//  DogDating
//
//  Created by Gabriel Ramos on 12/12/24.
//

import Foundation

@MainActor
class MatchManager: ObservableObject{
    @Published var matchedUser: User?
    
    func checkForMatch(withUser user:User) {
        let didMatch = Bool.random()
        
        if didMatch {
            matchedUser = user
        }
    }
}

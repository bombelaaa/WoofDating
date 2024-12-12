//
//  CardService.swift
//  DogDating
//
//  Created by Jimy on 12/10/24.
//

import Foundation

struct CardService {
    func fetchCards() async throws -> [CardModel] {
        let users = MockData.users
        return users.map({ CardModel(user: $0) })
        
    }
}

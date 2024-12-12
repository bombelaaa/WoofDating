//
//  CardModel.swift
//  DogDating
//
//  Created by Jimy on 12/10/24.
//

import Foundation

struct CardModel {
    let user: User
}

extension CardModel: Identifiable, Hashable {
    var id: String { return user.id }
}

//
//  User.swift
//  DogDating
//
//  Created by Jimy on 12/10/24.
//

import Foundation

struct User: Identifiable, Hashable {
    let id: String
    let fullname: String
    let age: Int
    let photoURLs: [String]
}

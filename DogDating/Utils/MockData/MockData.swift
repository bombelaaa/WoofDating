//
//  MockData.swift
//  DogDating
//
//  Created by Jimy on 12/10/24.
//

import Foundation

struct MockData {
    
    static let users: [User] = [
        .init(
            id: NSUUID().uuidString,
            fullname: "Bubby",
            age: 4,
            photoURLs: ["Bubby1","Bubby2"]
        ),
        .init(
            id: NSUUID().uuidString,
            fullname: "Pubby",
            age: 5,
            photoURLs: ["Bubby1","Bubby2"]
        ),
        .init(
            id: NSUUID().uuidString,
            fullname: "Shlubby",
            age: 6,
            photoURLs: ["Shlubby1","Shlubby2", "Shlubby3"]
        ),
    ]
}

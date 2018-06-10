//
//  Question.swift
//  WebService
//
//  Created by Muhammad Saqib Khan on 6/10/18.
//  Copyright © 2018 Muhammad Saqib Khan. All rights reserved.
//

import UIKit

struct Question {
    let title: String
    let score: Int
    let tags: [String]
    let date: Date
    let owner: User?
}


extension Question {
    private enum Keys: String, SerializationKey {
        case title
        case score
        case tags
        case owner
        case date = "creation_date"
    }
    
    init(serialization: Serialization) {
        title = serialization.value(forKey: Keys.title)!
        score = serialization.value(forKey: Keys.score)!
        tags = serialization.value(forKey: Keys.tags)!
        let creationdate: Int = serialization.value(forKey: Keys.date)!
        date = Date(timeIntervalSince1970: TimeInterval(creationdate))
        if let ownerSerialization: Serialization = serialization.value(forKey: Keys.owner) {
            owner = User(serialization: ownerSerialization)
        } else {
            owner = nil
        }
    }
}



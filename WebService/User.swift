//
//  User.swift
//  WebService
//
//  Created by Muhammad Saqib Khan on 6/10/18.
//  Copyright © 2018 Muhammad Saqib Khan. All rights reserved.
//

import UIKit

struct User {
    let name: String?
    let profileImageURL: URL?
    let reputation: Int?
}


extension User {
    private enum Keys: String, SerializationKey {
        case reputation
        case name = "display_name"
        case profileImage = "profile_image"
    }
    
    init(serialization: Serialization) {
        name = serialization.value(forKey: Keys.name)
        reputation = serialization.value(forKey: Keys.reputation)
        if let url: String = serialization.value(forKey: Keys.profileImage) {
            profileImageURL = URL(string: url)
        } else {
            profileImageURL = nil
        }
    }
}

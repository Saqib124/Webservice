//
//  ApiWrapper.swift
//  WebService
//
//  Created by Muhammad Saqib Khan on 6/10/18.
//  Copyright © 2018 Muhammad Saqib Khan. All rights reserved.
//

import UIKit

struct ApiWrapper {
    let items: [Serialization]
}


extension ApiWrapper {
    private enum Keys: String, SerializationKey {
        case items
    }
    
    init(serialization: Serialization) {
        items = serialization.value(forKey: Keys.items) ?? []
    }
}

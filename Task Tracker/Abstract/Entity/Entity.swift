//
//  Entity.swift
//  Task Tracker
//
//  Created by Alex Tsonev on 25.04.18.
//  Copyright © 2018 Oleksii Tsoniev. All rights reserved.
//

import Foundation

class Entity: Codable {
    
    var entityId: String!
    var collection: [Entity] = []
    
    required init() {
        entityId = UUID().uuidString
    }

}


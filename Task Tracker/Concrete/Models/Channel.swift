//
//  Channel.swift
//  Task Tracker
//
//  Created by Alex Tsonev on 25.04.18.
//  Copyright © 2018 Oleksii Tsoniev. All rights reserved.
//

import Foundation

class Channel: Entity {
    
    required init() {
        super.init()
        
        collection = [self]
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}

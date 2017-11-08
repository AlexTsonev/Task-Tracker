//
//  WeatherCollection.swift
//  Task Tracker
//
//  Created by Oleksii Tsoniev on 11/8/17.
//  Copyright © 2017 Oleksii Tsoniev. All rights reserved.
//

import Foundation

class WeatherCollection: Collection {
    
    override class func modelClass() -> ModelType.Type {
        return Weather.self
    }
    
    override static func collectionApiKeyPath() -> String {
        return "daily.data"
    }
    
}

//
//  File.swift
//  Task Tracker
//
//  Created by Oleksii Tsoniev on 11/8/17.
//  Copyright © 2017 Oleksii Tsoniev. All rights reserved.
//

import Foundation

class Model: ModelProtocol, MappingProtocol {  
    
    //MARK: - ModelProtocol

    required init(dictionary json: [String : Any?]) {
        map(dictionary: json)
    }

    //MARK: - MappingProtocol

    func map(dictionary: [String : Any?]) {
        assertionFailure("Mapping must be implemented")
    }
    
    func collection() -> [ModelProtocol]? {
        return [self]
    }
    
}


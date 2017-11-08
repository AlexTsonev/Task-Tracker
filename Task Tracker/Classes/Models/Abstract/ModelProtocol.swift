//
//  ModelProtocol.swift
//  Task Tracker
//
//  Created by Oleksii Tsoniev on 11/8/17.
//  Copyright © 2017 Oleksii Tsoniev. All rights reserved.
//

import Foundation

protocol ModelProtocol {
    init(dictionary: [String:Any?])
    func collection() -> [ModelProtocol]?
}

protocol CollectionProtocol: AnyObject {
    static func collectionApiKeyPath() -> String
    static func modelClass() -> ModelType.Type
}

protocol MappingProtocol {
    func map(dictionary: [String:Any?])
}

typealias ModelType = ModelProtocol


//
//  File.swift
//  Task Tracker
//
//  Created by Oleksii Tsoniev on 11/8/17.
//  Copyright © 2017 Oleksii Tsoniev. All rights reserved.
//

import Foundation
import SwiftyJSON

class Collection: Model, CollectionProtocol {

    //MARK: - Public
    
    var items: [ModelProtocol]?
    
    class func collectionApiKeyPath() -> String {
        assertionFailure("ApiKeyPath must be implemented")
        return "nil"
    }
    
    class func modelClass() -> ModelType.Type {
        assertionFailure("You should implement modelClass")
        return Model.self
    }
    
    override func collection() -> [ModelProtocol]? {
        return self.items
    }
    
    override func map(dictionary: [String : Any?]) {
        let key = type(of: self).collectionApiKeyPath()
        let array = dictionary[keyPath: KeyPath(key)] as? [Any?]
        guard array != nil else { return }
        self.items = items(with:array!)
    }
    
    //MARK: - Private
    
    fileprivate func items(with array: [Any?]) -> [ModelProtocol] {
        var resultArray: [ModelProtocol] = []
        let currentType = type(of: self).modelClass()
        array.forEach { (model) in
            let json = model as! [String:Any?]
            let model = currentType.init(dictionary: json)
            resultArray.append(model)
        }
        return resultArray
    }
}



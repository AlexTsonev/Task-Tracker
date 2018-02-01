//
//  NSManagedObjectExtensions.swift
//  Task Tracker
//
//  Created by Alex Tsonev on 31.01.18.
//  Copyright © 2018 Oleksii Tsoniev. All rights reserved.
//

import Foundation
import CoreData

extension CodingUserInfoKey {
    static let context = CodingUserInfoKey(rawValue: "context")
}

extension NSManagedObject {
    public convenience init(from decoder: Decoder) {
        guard let contextUserInfoKey = CodingUserInfoKey.context,
            let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: String(describing:type(of: self)), in: managedObjectContext) else {
                fatalError("Failed to decode!")
        }
        self.init(entity: entity, insertInto: nil)
    }
}

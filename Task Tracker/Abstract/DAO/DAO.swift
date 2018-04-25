//
//  DAO.swift
//  DAO
//
//  Created by Igor Bulyga on 04.02.16.
//  Copyright © 2016 RedMadRobot LLC. All rights reserved.
//

import Foundation

class DAO<Model: Entity> {
    
    open func persist(entity: Model) throws {
        preconditionFailure()
    }
    
    open func persist(entities: [Model]) throws {
        preconditionFailure()
    }
    
    open func read(_ entityId: String) -> Model? {
        preconditionFailure()
    }
    
    open func read() -> [Model] {
        preconditionFailure()
    }
    
    open func read(predicatedBy predicate: NSPredicate?) -> [Model] {
        preconditionFailure()
    }
    
    open func read(orderedBy field: String?, ascending: Bool) -> [Model] {
        preconditionFailure()
    }
    
    open func read(predicatedBy predicate: NSPredicate?, orderedBy field: String?,
                   ascending: Bool) -> [Model] {
        preconditionFailure()
    }
    
    open func erase() throws {
        preconditionFailure()
    }
    
    open func erase(_ entityId: String) throws {
        preconditionFailure()
    }
    
}


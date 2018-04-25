
//
//  CoreDataTranslator.swift
//  DAO
//
//


import Foundation
import CoreData

class CoreDataTranslator<CDModel: NSManagedObject, Model: Entity> {
    
    open var entryClassName: String {
        return NSStringFromClass(CDModel.self).components(separatedBy: ".").last!
    }
    
    required public init() { }
    
    open func fill(_ entity: Model, fromEntry: CDModel) {
        fatalError("Abstact method")
    }
    
    open func fill(_ entry: CDModel, fromEntity: Model, in context: NSManagedObjectContext) {
        fatalError("Abstact method")
    }
    
    open func fill(
        _ entries: inout Set<CDModel>,
        fromEntities: [Model],
        in context: NSManagedObjectContext) {
        
        fromEntities
            .flatMap { entity -> (CDModel, Model)? in
                if let entry = NSEntityDescription.insertNewObject(
                    forEntityName: self.entryClassName,
                    into: context) as? CDModel {
                    entries.insert(entry)
                    return (entry, entity)
                } else {
                    return nil
                }
            }
            .forEach {
                self.fill($0.0, fromEntity: $0.1, in: context)
        }
    }
    
    open func fill(_ entities: inout [Model], fromEntries: Set<CDModel>?) {
        entities.removeAll()
        
        fromEntries?.forEach {
            let model = Model()
            entities.append(model)
            self.fill(model, fromEntry: $0)
        }
    }
    
}

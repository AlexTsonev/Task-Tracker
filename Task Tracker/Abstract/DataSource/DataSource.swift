//
//  DataSource.swift
//  Task Tracker
//
//  Created by Alex Tsonev on 31.01.18.
//  Copyright © 2018 Oleksii Tsoniev. All rights reserved.
//

import Foundation

class DataSource<Model: Entity> {
    
    typealias DataSourceLoadingSuccess = ([Model]) -> ()
    typealias DataSourceReloadingSuccess = ([Model]) -> ()
    typealias DataSourceLoadingFailure = ([Model]) -> ()
    
    var loader: RemoteFetching?
    var storage: DAO<Entity>
    
    var loadingCompletions: [DataSourceLoadingSuccess] = [] {
        didSet {
            load()
        }
    }
    var failureCompletions: [DataSourceLoadingFailure] = []
    
    var entities: [Model] = []
    var pageSize: Int = 30
    
    init(loader: RemoteFetching?, storage: DAO<Entity>) {
        self.loader = loader
        self.storage = storage
        
        loader?.observe(success: { [unowned self] (models) in
            try? self.storage.persist(entities: models)
            
        }, failure: { (error) in
            print(error)
        })
    }
    
    deinit {
        loader?.removeAllObservers()
    }
    
    func load(page: Int? = nil, predicate: NSPredicate? = nil, orderedBy: String? = nil,   ascending: Bool = true) {
        let localEntities = storage.read(predicatedBy: predicate, orderedBy: orderedBy, ascending: ascending) as? [Model]
        var callbackModels = localEntities ?? entities
        
        if page != nil {
            callbackModels = Array(entities.dropFirst(pageSize * page!))
        }
        
        loadingCompletions.forEach({ (completion) in
            completion(callbackModels)
        })
    }
    
}

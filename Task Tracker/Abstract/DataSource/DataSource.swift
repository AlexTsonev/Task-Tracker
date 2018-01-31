//
//  DataSource.swift
//  Task Tracker
//
//  Created by Alex Tsonev on 31.01.18.
//  Copyright © 2018 Oleksii Tsoniev. All rights reserved.
//

import Foundation

struct DataSource<Model: Entity> {
    
    var loader: RemoteFetching?
    var storage: DAO<Model>?
    
    init(loader: RemoteFetching?, storage: DAO<Model>?) {
        self.loader = loader
        self.storage = storage
    }
    
    
    
}

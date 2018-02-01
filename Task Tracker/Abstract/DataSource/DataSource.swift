//
//  DataSource.swift
//  Task Tracker
//
//  Created by Alex Tsonev on 31.01.18.
//  Copyright © 2018 Oleksii Tsoniev. All rights reserved.
//

import Foundation
import CoreData

struct DataSource<Model: NSManagedObject & Codable> {
    
    var loader: RemoteFetching?
    var context: NSManagedObjectContext?
    
    init(loader: RemoteFetching?, context: NSManagedObjectContext) {
        self.loader = loader
        self.context = context
    }
    
    
    
}

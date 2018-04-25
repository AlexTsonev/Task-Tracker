//
//  FirebaseLoader.swift
//  Task Tracker
//
//  Created by Alex Tsonev on 31.01.18.
//  Copyright © 2018 Oleksii Tsoniev. All rights reserved.
//

import Foundation
import FirebaseDatabase

class FirebaseObserver<Model: Entity>: RemoteFetching {
    
    fileprivate var reference: DatabaseReference
    
    init(path: String) {
        reference = Database.database().reference(withPath: path)
    }
    
    deinit {
        removeAllObservers()
    }
    
    func load(success: @escaping RemoteLoadingSuccess, failure: @escaping RemoteLoadingFailure) {
        reference.observeSingleEvent(of: .value) { (snapshot) in
            guard let data = snapshot.value as? Data,
                let model = try? JSONDecoder().decode(Model.self, from: data) else {
                return
            }
            
            success(model.collection)
        }
    }
    
    func observe(success: @escaping RemoteLoadingSuccess, failure: @escaping RemoteLoadingFailure) {
        reference.observe(.value) { (snapshot) in
            guard let data = snapshot.value as? Data,
                let model = try? JSONDecoder().decode(Model.self, from: data) else {
                    return
            }
            
            success(model.collection)
        }
        
    }
    
    func removeAllObservers() {
        reference.removeAllObservers()
    }

}
